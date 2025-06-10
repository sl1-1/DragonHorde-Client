import 'dart:collection';
import 'package:dragonhorde_client_flutter/api_provider.dart';

import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:dio/dio.dart';

class CreatorListProvider extends ChangeNotifier {
  List<ApiCreator> _creators = [];
  bool _loading = true;

  Future<void> load() async{
    Response<CreatorsResults> results = await apiClient.getCreatorsApi().getCreators();
    _creators = results.data!.result.toList();
    _loading = false;
    notifyListeners();
  }

  UnmodifiableListView<ApiCreator>? get creators { 
    if(_creators.isEmpty){
    load();
    }
    return UnmodifiableListView(_creators);
  }

  bool loading() {
    return _loading;
  }

  CreatorListProvider ();
}
