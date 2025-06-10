import 'dart:async';
import 'dart:ui';

import 'package:dragonhorde_client_flutter/api_provider.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Thumbnail extends StatefulWidget {
  const Thumbnail({super.key, required this.id});
  final int id;

  @override
  State<Thumbnail> createState() => _ThumbnailState();
}

class _ThumbnailState extends State<Thumbnail> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image(image: ApiThumbnailImageProvider(widget.id)),
      ),
    );
  }
}

@immutable
class ApiThumbnailImageProvider extends ImageProvider<Uri> {
  const ApiThumbnailImageProvider(this.id);

  final int id;

  @override
  Future<Uri> obtainKey(ImageConfiguration configuration) {
    final Uri result = Uri.parse("api://thumbnail/$id");
    return SynchronousFuture<Uri>(result);
  }

  @override
  ImageStreamCompleter loadImage(Uri key, ImageDecoderCallback decode) {
    final StreamController<ImageChunkEvent> chunkEvents =
        StreamController<ImageChunkEvent>();
    debugPrint('Fetching "$key"...');
    return MultiFrameImageStreamCompleter(
      codec: apiClient
          .getMediaApi()
          .getMediaThumbnail(id: id)
          .then<Uint8List>((Response<Uint8List> results) {
            chunkEvents.add(
              ImageChunkEvent(
                cumulativeBytesLoaded: results.data!.lengthInBytes,
                expectedTotalBytes: results.data!.lengthInBytes,
              ),
            );
            return results.data!;
          })
          .catchError((Object e, StackTrace stack) {
            scheduleMicrotask(() {
              PaintingBinding.instance.imageCache.evict(key);
            });
            return Future<Uint8List>.error(e, stack);
          })
          .whenComplete(chunkEvents.close)
          .then<ImmutableBuffer>(ImmutableBuffer.fromUint8List)
          .then<Codec>(decode),

      chunkEvents: chunkEvents.stream,
      scale: 1.0,
      debugLabel: '"key"',
      informationCollector:
          () => <DiagnosticsNode>[
            DiagnosticsProperty<ImageProvider>('Image provider', this),
            DiagnosticsProperty<Uri>('URL', key),
          ],
    );
  }

  @override
  String toString() =>
      '${objectRuntimeType(this, 'ApiThumbnailImageProvider')}("api://thumbnail/$id")';
}
