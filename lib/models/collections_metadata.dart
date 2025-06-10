import 'dart:collection';

import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:dragonhorde_client_flutter/api_provider.dart';
import 'package:dragonhorde_client_flutter/collection.dart';
import 'package:dragonhorde_client_flutter/dialogs/create_collection.dart';
import 'package:dragonhorde_client_flutter/models/metadata_model.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

class CollectionMetadata extends MetadataItemModel {
  late String _name;
  late int _id;
  CollectionMetadata(String name, int id) {
    _name = name;
    _id = id;
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
    Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CollectionPage(id: _id),
                ),
              );
  }

  @override
  String? toolTip() {
    return null;
  }
  
  @override
  Icon get icon =>  Icon(Icons.folder);

  @override
  String toString() => _name;
  
  @override
  String get name => _name;
  
  @override
  bool get clickable => true;
  @override
  int get id => _id;
}

class CollectionsMetadata extends MetadataContainer {
  late List<CollectionMetadata> _items;
  late int _id;

  CollectionsMetadata(int id, Map<int, String> artists) {
    _id = id;
    _items = artists.entries.map((i) => CollectionMetadata(i.value, i.key)).toList();
  }

  @override
  Future<MetadataItemModel?> addItem(MetadataItemModel item) async {
    Response<ApiMedia> response = await apiClient.getMediaApi().mediaItemPatch(
                                    id: _id,
                                    apiMedia: ApiMedia(
                                      (b) => b..collections = ListBuilder([item.displayText, ..._items.map((i) => i.name)]),
                                    ),
    );
    if (response.statusCode != 200){
      return null;
    }
    _items.add(CollectionMetadata(item.name, item.id));
    notifyListeners();
    return item;
  }

  @override
  Future<List<MetadataItemModel>?> autoComplete(String text) async {
        Response<BuiltList<TagReturn>> response = await apiClient.getTagsApi().autocomplete(
          tag: text,
          tagType: "Collection",
        );

    return response.data!.map((p0) => CollectionMetadata(p0.tag, p0.id)).toList();
  }

  @override
  bool get canAdd => true;

  @override
  bool get canRemove => true;

  @override
  Icon get icon =>  Icon(Icons.folder);

  @override
  List<MetadataItemModel> get items => UnmodifiableListView(_items);

  @override
  String get name => "Collections";

  @override
  Widget newItem(context, String text) {
        return CreateCollectionDialog(text: text);
  }

  @override
  Future<bool> removeItem(MetadataItemModel item) async {
    debugPrint("Delete ${item.displayText}");
    List<CollectionMetadata> toDelete = [..._items];
    toDelete.remove(item);
    debugPrint(toDelete.toString());
    Response<ApiMedia> response = await apiClient.getMediaApi().mediaItemPatch(
                                    id: _id,
                                    apiMedia: ApiMedia(
                                      (b) => b..collections = ListBuilder([...toDelete.map((i) => i.name)]),
                                    ),
    );
    if (response.statusCode != 200){
      return false;
    }

    _items.remove(item);
    notifyListeners();
    return true;
  }
  
  @override
  MetadataItemModel newItemInstance(String text) {
    return CollectionMetadata(text, 0);
  }
}
