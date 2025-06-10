import 'package:dio/dio.dart';
import 'package:dragonhorde_client_flutter/api_provider.dart';
import 'package:dragonhorde_client_flutter/creator.dart';
import 'package:dragonhorde_client_flutter/models/grid_item.dart';
import 'package:dragonhorde_client_flutter/providers/creator_provider.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:provider/provider.dart';

class CreatorItemModel extends GridItemModel {
  late final int id;
  late ApiCreator model;

  CreatorItemModel.fromId(this.id) {
    load(id: id);
  }

  CreatorItemModel.fromItem(this.model) {
    id = model.id!;
  }

  Future<void> load({required int id}) async {
    Response<ApiCreator> results = await apiClient.getCreatorsApi().getCreatorsId(id: id);
    model = results.data!;
  }

  @override
  void navigate(context) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => MultiProvider(
                        providers: [
                          ChangeNotifierProvider<CreatorProvider>(
                            create:
                                (context) => CreatorProvider.fromCreator(creator: model),
                          ),
                        ],
                        child: const CreatorPage(),
                      ),
                ),
              );
  }

  @override
  // TODO: implement onHover
  Widget get onHover => throw UnimplementedError();

  @override
  Widget get thumbnail => Text(model.name!);

  @override
  String get title => throw UnimplementedError();
}
