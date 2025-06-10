//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'tag_return.g.dart';

/// TagReturn
///
/// Properties:
/// * [id] 
/// * [tag] 
/// * [tagType] 
@BuiltValue()
abstract class TagReturn implements Built<TagReturn, TagReturnBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'tag')
  String get tag;

  @BuiltValueField(wireName: r'tag_type')
  TagReturnTagTypeEnum get tagType;
  // enum tagTypeEnum {  All,  Tag,  Artist,  Collection,  };

  TagReturn._();

  factory TagReturn([void updates(TagReturnBuilder b)]) = _$TagReturn;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TagReturnBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TagReturn> get serializer => _$TagReturnSerializer();
}

class _$TagReturnSerializer implements PrimitiveSerializer<TagReturn> {
  @override
  final Iterable<Type> types = const [TagReturn, _$TagReturn];

  @override
  final String wireName = r'TagReturn';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TagReturn object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'tag';
    yield serializers.serialize(
      object.tag,
      specifiedType: const FullType(String),
    );
    yield r'tag_type';
    yield serializers.serialize(
      object.tagType,
      specifiedType: const FullType(TagReturnTagTypeEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    TagReturn object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TagReturnBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'tag':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.tag = valueDes;
          break;
        case r'tag_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(TagReturnTagTypeEnum),
          ) as TagReturnTagTypeEnum;
          result.tagType = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TagReturn deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TagReturnBuilder();
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

class TagReturnTagTypeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'All')
  static const TagReturnTagTypeEnum all = _$tagReturnTagTypeEnum_all;
  @BuiltValueEnumConst(wireName: r'Tag')
  static const TagReturnTagTypeEnum tag = _$tagReturnTagTypeEnum_tag;
  @BuiltValueEnumConst(wireName: r'Artist')
  static const TagReturnTagTypeEnum artist = _$tagReturnTagTypeEnum_artist;
  @BuiltValueEnumConst(wireName: r'Collection')
  static const TagReturnTagTypeEnum collection = _$tagReturnTagTypeEnum_collection;

  static Serializer<TagReturnTagTypeEnum> get serializer => _$tagReturnTagTypeEnumSerializer;

  const TagReturnTagTypeEnum._(String name): super(name);

  static BuiltSet<TagReturnTagTypeEnum> get values => _$tagReturnTagTypeEnumValues;
  static TagReturnTagTypeEnum valueOf(String name) => _$tagReturnTagTypeEnumValueOf(name);
}

