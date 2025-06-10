//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/api_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'collection_result.g.dart';

/// CollectionResult
///
/// Properties:
/// * [result] 
@BuiltValue()
abstract class CollectionResult implements Built<CollectionResult, CollectionResultBuilder> {
  @BuiltValueField(wireName: r'result')
  BuiltList<ApiCollection> get result;

  CollectionResult._();

  factory CollectionResult([void updates(CollectionResultBuilder b)]) = _$CollectionResult;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CollectionResultBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CollectionResult> get serializer => _$CollectionResultSerializer();
}

class _$CollectionResultSerializer implements PrimitiveSerializer<CollectionResult> {
  @override
  final Iterable<Type> types = const [CollectionResult, _$CollectionResult];

  @override
  final String wireName = r'CollectionResult';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CollectionResult object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'result';
    yield serializers.serialize(
      object.result,
      specifiedType: const FullType(BuiltList, [FullType(ApiCollection)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CollectionResult object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CollectionResultBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'result':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ApiCollection)]),
          ) as BuiltList<ApiCollection>;
          result.result.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CollectionResult deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CollectionResultBuilder();
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

