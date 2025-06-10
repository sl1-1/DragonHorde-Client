import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for SearchApi
void main() {
  final instance = Openapi().getSearchApi();

  group(SearchApi, () {
    //Future<SearchResult> hashSearch({ int hash, int maxDistance, int perPage, int last }) async
    test('test hashSearch', () async {
      // TODO
    });

    //Future<SearchResult> searchQuery({ BuiltList<String> tags, BuiltList<String> creators, int perPage, int last }) async
    test('test searchQuery', () async {
      // TODO
    });

  });
}
