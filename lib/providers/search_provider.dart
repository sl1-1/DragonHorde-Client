import 'dart:collection';
import 'package:dragonhorde_client_flutter/api_provider.dart';
import 'package:dragonhorde_client_flutter/models/media_grid_item.dart';
import 'package:dragonhorde_client_flutter/util/value_notifier_list.dart';
import 'package:flutter/material.dart';

import 'package:openapi/openapi.dart';
import 'package:dio/dio.dart';
import 'package:built_collection/built_collection.dart';

class SearchProvider with ChangeNotifier {
  final ValueNotifierList<MediaItemModel> items = ValueNotifierList([]);
  final List<TagReturn> _artists = [];
  final List<TagReturn> _tags = [];
  final List<TagReturn> _collection = [];
  bool _loading = true;

  // UnmodifiableListView<MediaItemModel> get items => UnmodifiableListView(_items);
  UnmodifiableListView<TagReturn> get artists => UnmodifiableListView(_artists);
  UnmodifiableListView<TagReturn> get tags => UnmodifiableListView(_tags);


  bool loading() {
    return _loading;
  }

  Future<void> search({int? last}) async {
    Response<SearchResult> results = await apiClient.getSearchApi().searchQuery(
      tags: BuiltList(
        _tags.map((item) {
          return item.tag;
        }),
      ),
      creators: BuiltList(
        _artists.map((item) {
          return item.tag;
        }),
      ),
      perPage: 20,
      last: last ?? 0,
    );
    items.addAll(results.data!.result.map((p0) => MediaItemModel.fromItem(p0, this)).toList());
    _loading = false;
    notifyListeners();
  }

  Future<void> more() async {
    if (items.isNotEmpty && !_loading) {
      _loading = true;
      search(last: items.value.length - 1);
    }
  }

  Future<void> addTag({required TagReturn tag}) async {
    switch (tag.tagType) {
      case TagReturnTagTypeEnum.all:
        throw UnimplementedError();
      case TagReturnTagTypeEnum.artist:
        _artists.add(tag);
        break;
      case TagReturnTagTypeEnum.collection:
        _collection.add(tag);
        break;
      case TagReturnTagTypeEnum.tag:
        _tags.add(tag);
        break;
    }
    _loading = true;
    items.clear();
    notifyListeners();
    search();
  }

  Future<void> deleteTag({required TagReturn tag}) async {
    switch (tag.tagType) {
      case TagReturnTagTypeEnum.all:
        throw UnimplementedError();
      case TagReturnTagTypeEnum.artist:
        _artists.removeWhere((item) => item == tag);
        break;
      case TagReturnTagTypeEnum.collection:
        _collection.removeWhere((item) => item == tag);
        break;
      case TagReturnTagTypeEnum.tag:
        _tags.removeWhere((item) => item == tag);
        break;
    }
    _loading = true;
    items.clear();
    notifyListeners();
    search();
  }
}
