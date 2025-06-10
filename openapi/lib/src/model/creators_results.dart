//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/api_creator.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'creators_results.g.dart';

/// CreatorsResults
///
/// Properties:
/// * [result] 
@BuiltValue()
abstract class CreatorsResults implements Built<CreatorsResults, CreatorsResultsBuilder> {
  @BuiltValueField(wireName: r'result')
  BuiltList<ApiCreator> get result;

  CreatorsResults._();

  factory CreatorsResults([void updates(CreatorsResultsBuilder b)]) = _$CreatorsResults;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreatorsResultsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreatorsResults> get serializer => _$CreatorsResultsSerializer();
}

class _$CreatorsResultsSerializer implements PrimitiveSerializer<CreatorsResults> {
  @override
  final Iterable<Type> types = const [CreatorsResults, _$CreatorsResults];

  @override
  final String wireName = r'CreatorsResults';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreatorsResults object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'result';
    yield serializers.serialize(
      object.result,
      specifiedType: const FullType(BuiltList, [FullType(ApiCreator)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CreatorsResults object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreatorsResultsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'result':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ApiCreator)]),
          ) as BuiltList<ApiCreator>;
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
  CreatorsResults deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreatorsResultsBuilder();
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

