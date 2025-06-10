//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'add_item.g.dart';

/// AddItem
///
/// Properties:
/// * [mediaId] 
/// * [ord] 
@BuiltValue()
abstract class AddItem implements Built<AddItem, AddItemBuilder> {
  @BuiltValueField(wireName: r'media_id')
  int get mediaId;

  @BuiltValueField(wireName: r'ord')
  int get ord;

  AddItem._();

  factory AddItem([void updates(AddItemBuilder b)]) = _$AddItem;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AddItemBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AddItem> get serializer => _$AddItemSerializer();
}

class _$AddItemSerializer implements PrimitiveSerializer<AddItem> {
  @override
  final Iterable<Type> types = const [AddItem, _$AddItem];

  @override
  final String wireName = r'AddItem';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AddItem object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'media_id';
    yield serializers.serialize(
      object.mediaId,
      specifiedType: const FullType(int),
    );
    yield r'ord';
    yield serializers.serialize(
      object.ord,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AddItem object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AddItemBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'media_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.mediaId = valueDes;
          break;
        case r'ord':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.ord = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AddItem deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AddItemBuilder();
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

