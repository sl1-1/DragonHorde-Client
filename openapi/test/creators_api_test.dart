import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for CreatorsApi
void main() {
  final instance = Openapi().getCreatorsApi();

  group(CreatorsApi, () {
    //Future<CreatorsResults> getCreators() async
    test('test getCreators', () async {
      // TODO
    });

    //Future<ApiCreator> getCreatorsByAlias(String alias) async
    test('test getCreatorsByAlias', () async {
      // TODO
    });

    //Future<CollectionResult> getCreatorsCollection(int id) async
    test('test getCreatorsCollection', () async {
      // TODO
    });

    //Future<ApiCreator> getCreatorsId(int id) async
    test('test getCreatorsId', () async {
      // TODO
    });

    //Future<SearchResult> getCreatorsMedia(int id, { int perPage, int last }) async
    test('test getCreatorsMedia', () async {
      // TODO
    });

    //Future<SearchResult> getCreatorsUncollected(int id, { int perPage, int last }) async
    test('test getCreatorsUncollected', () async {
      // TODO
    });

    //Future<ApiCreator> patchCreatorsId(int id, ApiCreator apiCreator) async
    test('test patchCreatorsId', () async {
      // TODO
    });

  });
}
