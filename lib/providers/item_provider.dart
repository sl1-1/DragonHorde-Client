// import 'package:dragonhorde_client_flutter/api_provider.dart';

// import 'package:flutter/material.dart';
// import 'package:openapi/openapi.dart';
// import 'package:dio/dio.dart';

// class MediaProvider extends ChangeNotifier {
//   ApiMedia? _item;
//   bool _loading = true;
//   int? _id;

//   ApiMedia? item() {
//     if (_item == null && _id != null){
//       load(id: _id!);
//     }
//     return _item;
//   }

//   bool loading() {
//     return _loading;
//   }

//   Future<void> load({required int id}) async {
//     Response<ApiMedia> results = await apiClient.getMediaApi().getMediaItem(
//       id: id,
//     );
//     _item = results.data!;
//     _loading = false;
//     notifyListeners();
//   }

//   MediaProvider.fromItem({required ApiMedia item}) {
//     _item = item;
//     _loading = false;
//   }

//   MediaProvider.fromId({required int id}) {
//     _id = id;
//     _loading = true;
//   }

//   MediaProvider();
// }
