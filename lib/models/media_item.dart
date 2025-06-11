import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:dragonhorde_client_flutter/api_provider.dart';
import 'package:dragonhorde_client_flutter/item.dart';
import 'package:dragonhorde_client_flutter/models/artists_metadata.dart';
import 'package:dragonhorde_client_flutter/models/collections_metadata.dart';
import 'package:dragonhorde_client_flutter/models/grid_item.dart';
import 'package:dragonhorde_client_flutter/models/sources_metadata.dart';
import 'package:dragonhorde_client_flutter/providers/search_provider.dart';
import 'package:dragonhorde_client_flutter/widgets/thumbnail.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:provider/provider.dart';

class MediaItemModel extends GridItemModel with ChangeNotifier {
  late final int id;
  final SearchProvider? search;
  // late ApiMedia model;
  late ArtistsMetadata artists;
  late String _title;
  late CollectionsMetadata collections;
  late SourcesMetadata sources;
  late Map<String, List<String>> _tags;
  bool loading = true;

  void _fromApiModel(ApiMedia model) {
    artists = model.creators != null ? ArtistsMetadata(id, model.creators!.toList()) : ArtistsMetadata(id, []);
    _title = model.title != null ? model.title! : "";
    collections =
        model.collectionsWithId != null
            ? CollectionsMetadata(
              id,
              model.collectionsWithId!.map((p0, p1) => MapEntry<int, String>(int.parse(p0), p1)).toMap(),
            )
            : CollectionsMetadata(id, {});
    sources = model.sources != null ? SourcesMetadata(id, model.sources!.toList()) : SourcesMetadata(id, []);
    _tags =
        model.tagGroups != null
            ? model.tagGroups!.map((k, v) => MapEntry(k, v.toList())).asMap()
            : <String, List<String>>{};
    loading = false;
    notifyListeners();
  }

  MediaItemModel.fromId(this.id, this.search) {
    load(id: id);
  }

  MediaItemModel.fromItem(ApiMedia model, this.search) {
    id = model.id!;
    _fromApiModel(model);
  }

  Future<void> load({required int id}) async {
    Response<ApiMedia> results = await apiClient.getMediaApi().getMediaItem(id: id);
    _fromApiModel(results.data!);
  }

  @override
  void navigate(context) {
    if (search != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) => MultiProvider(
                providers: [ChangeNotifierProvider<SearchProvider>(create: (_) => search!)],
                child: ItemPage(enableSearch: true, search: search, item: this),
              ),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ItemPage(enableSearch: false, search: search, item: this)),
      );
    }
  }

  @override
  // TODO: implement onHover
  Widget get onHover => throw UnimplementedError();

  @override
  Widget get thumbnail => Center(
    child: ClipRRect(borderRadius: BorderRadius.circular(8.0), child: Image(image: ApiThumbnailImageProvider(id))),
  );

  @override
  String get title => _title;

  Map<String, List<String>> get tags => UnmodifiableMapView(_tags);
}
