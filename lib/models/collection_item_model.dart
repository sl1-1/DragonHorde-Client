import 'package:dio/dio.dart';
import 'package:dragonhorde_client_flutter/api_provider.dart';
import 'package:dragonhorde_client_flutter/collection.dart';
import 'package:dragonhorde_client_flutter/models/grid_item.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

class CollectionItemModel extends GridItemModel {
  late final int id;
  late ApiCollection model;

  CollectionItemModel.fromId(this.id) {
    load(id: id);
  }

  CollectionItemModel.fromItem(this.model) {
    id = model.id!;
  }

  Future<void> load({required int id}) async {
    Response<ApiCollection> results = await apiClient.getCollectionApi().getCollectionId(id: id);
    model = results.data!;
  }

  @override
  void navigate(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CollectionPage(id: id)));
  }

  @override
  // TODO: implement onHover
  Widget get onHover => throw UnimplementedError();

  @override
  Widget get thumbnail => Text(model.name!);

  @override
  String get title => throw UnimplementedError();
}
