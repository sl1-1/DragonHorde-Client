import 'dart:collection';

import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:dragonhorde_client_flutter/api_provider.dart';
import 'package:dragonhorde_client_flutter/models/metadata_model.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:url_launcher/url_launcher.dart';

class SourceMetadata extends MetadataItemModel {
  late String _name;
  bool _clickable = false;
  SourceMetadata(String name) {
    _name = name;
    _clickable = Uri.tryParse(_name)?.hasAbsolutePath ?? false;
  }

  @override
  Widget contextMenu(BuildContext context, Offset offset) {
    return AdaptiveTextSelectionToolbar.buttonItems(
      anchors: TextSelectionToolbarAnchors(primaryAnchor: offset),
      buttonItems: <ContextMenuButtonItem>[],
    );
  }

  @override
  InputChip displayChip(context) {
    return InputChip(
      visualDensity: VisualDensity(horizontal: -4, vertical: -4),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      deleteIconColor: Theme.of(context).colorScheme.onSecondary,
      label: Text(
        style: DefaultTextStyle.of(context).style.apply(color: Theme.of(context).colorScheme.onSecondary),
        _name,
      ),
      onDeleted: () {},
    );
  }

  @override
  String get displayText => _name;

  @override
  void onClick(context) {
    if (_clickable) {
      launchUrl(Uri.tryParse(_name)!);
    }
  }

  @override
  String? toolTip() {
    return _name;
  }

  @override
  Icon get icon => Icon(Icons.person);

  @override
  String toString() => _name;

  @override
  String get name => _name;

  @override
  // TODO: implement clickable
  bool get clickable => _clickable;

  @override
  // TODO: implement id
  int get id => 0;
}

class SourcesMetadata extends MetadataContainer {
  late List<SourceMetadata> _items;
  late int _id;

  SourcesMetadata(int id, List<String> artists) {
    _id = id;
    _items = artists.map((s) => SourceMetadata(s)).toList();
  }

  @override
  Future<MetadataItemModel?> addItem(MetadataItemModel item) async {
    Response<ApiMedia> response = await apiClient.getMediaApi().mediaItemPatch(
      id: _id,
      apiMedia: ApiMedia((b) => b..sources = ListBuilder([item.name, ..._items.map((i) => i.name)])),
    );
    if (response.statusCode != 200) {
      return null;
    }
    _items.add(SourceMetadata(item.name));
    notifyListeners();
    return item;
  }

  @override
  Future<List<MetadataItemModel>?> autoComplete(String text) async {
    Response<BuiltList<TagReturn>> response = await apiClient.getTagsApi().autocomplete(tag: text, tagType: "Source");

    return response.data!.map((p0) => SourceMetadata(p0.tag)).toList();
  }

  @override
  bool get canAdd => false;

  @override
  bool get canRemove => false;

  @override
  Icon get icon => Icon(Icons.link);

  @override
  List<MetadataItemModel> get items => UnmodifiableListView(_items);

  @override
  String get name => "Sources";

  @override
  Widget newItem(context, String text) {
    throw UnimplementedError();
  }

  @override
  Future<bool> removeItem(MetadataItemModel item) async {
    debugPrint("Delete ${item.displayText}");
    List<SourceMetadata> toDelete = [..._items];
    toDelete.remove(item);
    debugPrint(toDelete.toString());
    Response<ApiMedia> response = await apiClient.getMediaApi().mediaItemPatch(
      id: _id,
      apiMedia: ApiMedia((b) => b..creators = ListBuilder([...toDelete.map((i) => i._name)])),
    );
    if (response.statusCode != 200) {
      return false;
    }

    _items.remove(item);
    notifyListeners();
    return true;
  }

  @override
  MetadataItemModel newItemInstance(String text) {
    return SourceMetadata(text);
  }
}
