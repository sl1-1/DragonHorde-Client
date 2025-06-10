import 'dart:collection';
import 'package:dragonhorde_client_flutter/api_provider.dart';

import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:dio/dio.dart';

class CreatorProvider extends ChangeNotifier {
  List<String> _aliases = [];
  List<ApiCollection>? _collections;
  String _name = "";
  late DateTime _created;
  bool _loading = true;
  late int id;

  UnmodifiableListView<String> get aliases => UnmodifiableListView(_aliases);
  UnmodifiableListView<ApiCollection> get collections {
    if (_collections == null) {
      load_collections();
      return UnmodifiableListView([]);
    } else {
      return UnmodifiableListView(_collections!);
    }
  }

  String get name => _name;
  DateTime get created => _created;

  Future<void> load() async {
    Response<ApiCreator> results = await apiClient.getCreatorsApi().getCreatorsId(id: id);
    _aliases = results.data!.aliases!.toList();
    _name = results.data!.name!;
    _created = results.data!.created!;
    _loading = false;
    notifyListeners();
  }

  Future<void> loadAlias(String alias) async {
    Response<ApiCreator> results = await apiClient.getCreatorsApi().getCreatorsByAlias(alias: alias.toLowerCase());
    _aliases = results.data!.aliases!.toList();
    _name = results.data!.name!;
    _created = results.data!.created!;
    _loading = false;
    id = results.data!.id!;
    notifyListeners();
  }

  Future<void> load_collections() async {
    Response<CollectionResult> results = await apiClient.getCreatorsApi().getCreatorsCollection(id: id);
    _collections = results.data!.result.toList();
    notifyListeners();
  }

  bool loading() {
    return _loading;
  }

  // CreatorProvider ({required this.id});
  CreatorProvider.fromCreator({required ApiCreator creator}) {
    _aliases = creator.aliases!.toList();
    _name = creator.name!;
    id = creator.id!;
    _created = creator.created!;
    _loading = false;
  }
  CreatorProvider.fromAlias({required String alias}) {
    loadAlias(alias);
  }
}
