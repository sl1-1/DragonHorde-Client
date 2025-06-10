import 'dart:collection';

import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:dragonhorde_client_flutter/api_provider.dart';
import 'package:dragonhorde_client_flutter/creator.dart';
import 'package:dragonhorde_client_flutter/dialogs/create_artist.dart';
import 'package:dragonhorde_client_flutter/models/metadata_model.dart';
import 'package:dragonhorde_client_flutter/providers/creator_provider.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:provider/provider.dart';

class ArtistMetadata extends MetadataItemModel {
  late String _name;
  ArtistMetadata(String name) {
    _name = name;
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
    debugPrint("Going to $_name");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) => MultiProvider(
                providers: [
                  ChangeNotifierProvider<CreatorProvider>(
                    create: (context) => CreatorProvider.fromAlias(alias: _name),
                  ),
                ],
                child: const CreatorPage(),
              ),
        ),
      );
  }

  @override
  String? toolTip() {
    return null;
  }

  @override
  Icon get icon => Icon(Icons.person);

  @override
  String toString() => _name;

  @override
  String get name => _name;

  @override
  bool get clickable => true;
  
  @override
  // TODO: implement id
  int get id => 0;
}

class ArtistsMetadata extends MetadataContainer {
  late List<ArtistMetadata> _items;
  late int _id;

  ArtistsMetadata(int id, List<String> artists) {
    _id = id;
    _items = artists.map((s) => ArtistMetadata(s)).toList();
  }

  @override
  Future<MetadataItemModel?> addItem(MetadataItemModel item) async {
    Response<ApiMedia> response = await apiClient.getMediaApi().mediaItemPatch(
      id: _id,
      apiMedia: ApiMedia((b) => b..creators = ListBuilder([item.name, ..._items.map((i) => i.name)])),
    );
    if (response.statusCode != 200) {
      return null;
    }
    _items.add(ArtistMetadata(item.name));
    notifyListeners();
    return item;
  }

  @override
  Future<List<MetadataItemModel>?> autoComplete(String text) async {
    Response<BuiltList<TagReturn>> response = await apiClient.getTagsApi().autocomplete(tag: text, tagType: "Artist");

    return response.data!.map((p0) => ArtistMetadata(p0.tag)).toList();
  }

  @override
  bool get canAdd => true;

  @override
  // TODO: implement canRemove
  bool get canRemove => true;

  @override
  Icon get icon => Icon(Icons.person);

  @override
  List<MetadataItemModel> get items => UnmodifiableListView(_items);

  @override
  String get name => "Artists";

  @override
  Widget newItem(context, String text) {
    return CreateArtistDialog(text: text);
  }

  @override
  Future<bool> removeItem(MetadataItemModel item) async {
    debugPrint("Delete ${item.displayText}");
    List<ArtistMetadata> toDelete = [..._items];
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
    return ArtistMetadata(text);
  }
}
