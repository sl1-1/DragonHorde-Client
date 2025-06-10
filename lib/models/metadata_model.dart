import 'package:flutter/material.dart';

abstract class MetadataItemModel {
  /// The identifier used for this object on the backend
  String get name;
  int get id;
  String get displayText;
  InputChip displayChip(context);
  bool get clickable;
  void onClick(context);
  String? toolTip();
  Widget contextMenu(BuildContext context, Offset offset); 
  Icon get icon;
  @override
  String toString();
}

abstract class MetadataContainer with ChangeNotifier {
  String get name;
  Future<List<MetadataItemModel>?> autoComplete(String text);
  Future<bool> removeItem(MetadataItemModel item);
  bool get canRemove;
  Future<MetadataItemModel?> addItem(MetadataItemModel item);
  bool get canAdd;
  Widget newItem(BuildContext context, String text);
  List<MetadataItemModel> get items;
  Icon get icon;
  MetadataItemModel newItemInstance(String text);
}