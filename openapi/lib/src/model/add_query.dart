//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/add_item.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'add_query.g.dart';

/// AddQuery
///
/// Properties:
/// * [media] 
@BuiltValue()
abstract class AddQuery implements Built<AddQuery, AddQueryBuilder> {
  @BuiltValueField(wireName: r'media')
  BuiltList<AddItem> get media;

  AddQuery._();

  factory AddQuery([void updates(AddQueryBuilder b)]) = _$AddQuery;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AddQueryBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AddQuery> get serializer => _$AddQuerySerializer();
}

class _$AddQuerySerializer implements PrimitiveSerializer<AddQuery> {
  @override
  final Iterable<Type> types = const [AddQuery, _$AddQuery];

  @override
  final String wireName = r'AddQuery';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AddQuery object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'media';
    yield serializers.serialize(
      object.media,
      specifiedType: const FullType(BuiltList, [FullType(AddItem)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AddQuery object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AddQueryBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'media':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(AddItem)]),
          ) as BuiltList<AddItem>;
          result.media.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AddQuery deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AddQueryBuilder();
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

