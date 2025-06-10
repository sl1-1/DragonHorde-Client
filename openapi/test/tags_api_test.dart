import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for TagsApi
void main() {
  final instance = Openapi().getTagsApi();

  group(TagsApi, () {
    //Future<BuiltList<TagReturn>> autocomplete(String tag, { String tagType }) async
    test('test autocomplete', () async {
      // TODO
    });

    //Future<BuiltList<String>> searchTags(String tag) async
    test('test searchTags', () async {
      // TODO
    });

  });
}
