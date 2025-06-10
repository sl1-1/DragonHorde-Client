//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'api_media.g.dart';

/// ApiMedia
///
/// Properties:
/// * [collections] - Collections this item is in
/// * [collectionsWithId] - Collections this item is in
/// * [created] - date-time that this item was created, if known
/// * [creators] 
/// * [description] - Description of this item, if available
/// * [distance] - Distance when searching by perceptual hash
/// * [id] 
/// * [perceptualHash] 
/// * [sha256] 
/// * [sources] - Known source locations for this item
/// * [storageUri] 
/// * [tagGroups] 
/// * [title] 
/// * [uploaded] - date-time that this item was uploaded
@BuiltValue()
abstract class ApiMedia implements Built<ApiMedia, ApiMediaBuilder> {
  /// Collections this item is in
  @BuiltValueField(wireName: r'collections')
  BuiltList<String>? get collections;

  /// Collections this item is in
  @BuiltValueField(wireName: r'collections_with_id')
  BuiltMap<String, String>? get collectionsWithId;

  /// date-time that this item was created, if known
  @BuiltValueField(wireName: r'created')
  DateTime? get created;

  @BuiltValueField(wireName: r'creators')
  BuiltList<String>? get creators;

  /// Description of this item, if available
  @BuiltValueField(wireName: r'description')
  String? get description;

  /// Distance when searching by perceptual hash
  @BuiltValueField(wireName: r'distance')
  double? get distance;

  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'perceptual_hash')
  int? get perceptualHash;

  @BuiltValueField(wireName: r'sha256')
  String? get sha256;

  /// Known source locations for this item
  @BuiltValueField(wireName: r'sources')
  BuiltList<String>? get sources;

  @BuiltValueField(wireName: r'storage_uri')
  String? get storageUri;

  @BuiltValueField(wireName: r'tag_groups')
  BuiltMap<String, BuiltList<String>>? get tagGroups;

  @BuiltValueField(wireName: r'title')
  String? get title;

  /// date-time that this item was uploaded
  @BuiltValueField(wireName: r'uploaded')
  DateTime? get uploaded;

  ApiMedia._();

  factory ApiMedia([void updates(ApiMediaBuilder b)]) = _$ApiMedia;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApiMediaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ApiMedia> get serializer => _$ApiMediaSerializer();
}

class _$ApiMediaSerializer implements PrimitiveSerializer<ApiMedia> {
  @override
  final Iterable<Type> types = const [ApiMedia, _$ApiMedia];

  @override
  final String wireName = r'ApiMedia';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ApiMedia object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.collections != null) {
      yield r'collections';
      yield serializers.serialize(
        object.collections,
        specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
      );
    }
    if (object.collectionsWithId != null) {
      yield r'collections_with_id';
      yield serializers.serialize(
        object.collectionsWithId,
        specifiedType: const FullType(BuiltMap, [FullType(String), FullType(String)]),
      );
    }
    if (object.created != null) {
      yield r'created';
      yield serializers.serialize(
        object.created,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.creators != null) {
      yield r'creators';
      yield serializers.serialize(
        object.creators,
        specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
      );
    }
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.distance != null) {
      yield r'distance';
      yield serializers.serialize(
        object.distance,
        specifiedType: const FullType.nullable(double),
      );
    }
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.perceptualHash != null) {
      yield r'perceptual_hash';
      yield serializers.serialize(
        object.perceptualHash,
        specifiedType: const FullType(int),
      );
    }
    if (object.sha256 != null) {
      yield r'sha256';
      yield serializers.serialize(
        object.sha256,
        specifiedType: const FullType(String),
      );
    }
    if (object.sources != null) {
      yield r'sources';
      yield serializers.serialize(
        object.sources,
        specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
      );
    }
    if (object.storageUri != null) {
      yield r'storage_uri';
      yield serializers.serialize(
        object.storageUri,
        specifiedType: const FullType(String),
      );
    }
    if (object.tagGroups != null) {
      yield r'tag_groups';
      yield serializers.serialize(
        object.tagGroups,
        specifiedType: const FullType(BuiltMap, [FullType(String), FullType(BuiltList, [FullType(String)])]),
      );
    }
    if (object.title != null) {
      yield r'title';
      yield serializers.serialize(
        object.title,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.uploaded != null) {
      yield r'uploaded';
      yield serializers.serialize(
        object.uploaded,
        specifiedType: const FullType(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ApiMedia object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ApiMediaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'collections':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.collections.replace(valueDes);
          break;
        case r'collections_with_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType(String)]),
          ) as BuiltMap<String, String>;
          result.collectionsWithId.replace(valueDes);
          break;
        case r'created':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.created = valueDes;
          break;
        case r'creators':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.creators.replace(valueDes);
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'distance':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.distance = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'perceptual_hash':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.perceptualHash = valueDes;
          break;
        case r'sha256':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sha256 = valueDes;
          break;
        case r'sources':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.sources.replace(valueDes);
          break;
        case r'storage_uri':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.storageUri = valueDes;
          break;
        case r'tag_groups':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType(BuiltList, [FullType(String)])]),
          ) as BuiltMap<String, BuiltList<String>>;
          result.tagGroups.replace(valueDes);
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.title = valueDes;
          break;
        case r'uploaded':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.uploaded = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ApiMedia deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiMediaBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

