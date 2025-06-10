import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for MediaApi
void main() {
  final instance = Openapi().getMediaApi();

  group(MediaApi, () {
    //Future<SearchResult> getMedia({ int perPage, int last }) async
    test('test getMedia', () async {
      // TODO
    });

    //Future<Uint8List> getMediaFile(int id) async
    test('test getMediaFile', () async {
      // TODO
    });

    //Future<ApiMedia> getMediaItem(int id) async
    test('test getMediaItem', () async {
      // TODO
    });

    //Future<ApiMedia> getMediaItemByHash(String hash) async
    test('test getMediaItemByHash', () async {
      // TODO
    });

    //Future<Uint8List> getMediaThumbnail(int id) async
    test('test getMediaThumbnail', () async {
      // TODO
    });

    //Future<ApiMedia> mediaItemPatch(int id, ApiMedia apiMedia) async
    test('test mediaItemPatch', () async {
      // TODO
    });

    //Future<ApiMedia> postMedia(ApiMedia data, BuiltList<int> file) async
    test('test postMedia', () async {
      // TODO
    });

    //Future<ApiMedia> updateMediaItem(int id, ApiMedia apiMedia) async
    test('test updateMediaItem', () async {
      // TODO
    });

  });
}
