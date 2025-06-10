import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for CollectionApi
void main() {
  final instance = Openapi().getCollectionApi();

  group(CollectionApi, () {
    //Future collectionIdAdd(int id, AddQuery addQuery) async
    test('test collectionIdAdd', () async {
      // TODO
    });

    //Future<ApiCollection> getCollectionId(int id) async
    test('test getCollectionId', () async {
      // TODO
    });

    //Future<ApiCollection> getCollectionName(String name) async
    test('test getCollectionName', () async {
      // TODO
    });

    //Future<ApiCollection> getCollectionPath(String path) async
    test('test getCollectionPath', () async {
      // TODO
    });

    //Future<CollectionResult> getCollections() async
    test('test getCollections', () async {
      // TODO
    });

    //Future<ApiCollection> patchCollectionId(int id, ApiCollection apiCollection) async
    test('test patchCollectionId', () async {
      // TODO
    });

    //Future<ApiCollection> postCollection(ApiCollection apiCollection) async
    test('test postCollection', () async {
      // TODO
    });

  });
}
