// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_return.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const TagReturnTagTypeEnum _$tagReturnTagTypeEnum_all =
    const TagReturnTagTypeEnum._('all');
const TagReturnTagTypeEnum _$tagReturnTagTypeEnum_tag =
    const TagReturnTagTypeEnum._('tag');
const TagReturnTagTypeEnum _$tagReturnTagTypeEnum_artist =
    const TagReturnTagTypeEnum._('artist');
const TagReturnTagTypeEnum _$tagReturnTagTypeEnum_collection =
    const TagReturnTagTypeEnum._('collection');

TagReturnTagTypeEnum _$tagReturnTagTypeEnumValueOf(String name) {
  switch (name) {
    case 'all':
      return _$tagReturnTagTypeEnum_all;
    case 'tag':
      return _$tagReturnTagTypeEnum_tag;
    case 'artist':
      return _$tagReturnTagTypeEnum_artist;
    case 'collection':
      return _$tagReturnTagTypeEnum_collection;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<TagReturnTagTypeEnum> _$tagReturnTagTypeEnumValues =
    BuiltSet<TagReturnTagTypeEnum>(const <TagReturnTagTypeEnum>[
  _$tagReturnTagTypeEnum_all,
  _$tagReturnTagTypeEnum_tag,
  _$tagReturnTagTypeEnum_artist,
  _$tagReturnTagTypeEnum_collection,
]);

Serializer<TagReturnTagTypeEnum> _$tagReturnTagTypeEnumSerializer =
    _$TagReturnTagTypeEnumSerializer();

class _$TagReturnTagTypeEnumSerializer
    implements PrimitiveSerializer<TagReturnTagTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'all': 'All',
    'tag': 'Tag',
    'artist': 'Artist',
    'collection': 'Collection',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'All': 'all',
    'Tag': 'tag',
    'Artist': 'artist',
    'Collection': 'collection',
  };

  @override
  final Iterable<Type> types = const <Type>[TagReturnTagTypeEnum];
  @override
  final String wireName = 'TagReturnTagTypeEnum';

  @override
  Object serialize(Serializers serializers, TagReturnTagTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  TagReturnTagTypeEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      TagReturnTagTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$TagReturn extends TagReturn {
  @override
  final int id;
  @override
  final String tag;
  @override
  final TagReturnTagTypeEnum tagType;

  factory _$TagReturn([void Function(TagReturnBuilder)? updates]) =>
      (TagReturnBuilder()..update(updates))._build();

  _$TagReturn._({required this.id, required this.tag, required this.tagType})
      : super._();
  @override
  TagReturn rebuild(void Function(TagReturnBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TagReturnBuilder toBuilder() => TagReturnBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TagReturn &&
        id == other.id &&
        tag == other.tag &&
        tagType == other.tagType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, tag.hashCode);
    _$hash = $jc(_$hash, tagType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TagReturn')
          ..add('id', id)
          ..add('tag', tag)
          ..add('tagType', tagType))
        .toString();
  }
}

class TagReturnBuilder implements Builder<TagReturn, TagReturnBuilder> {
  _$TagReturn? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _tag;
  String? get tag => _$this._tag;
  set tag(String? tag) => _$this._tag = tag;

  TagReturnTagTypeEnum? _tagType;
  TagReturnTagTypeEnum? get tagType => _$this._tagType;
  set tagType(TagReturnTagTypeEnum? tagType) => _$this._tagType = tagType;

  TagReturnBuilder() {
    TagReturn._defaults(this);
  }

  TagReturnBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _tag = $v.tag;
      _tagType = $v.tagType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TagReturn other) {
    _$v = other as _$TagReturn;
  }

  @override
  void update(void Function(TagReturnBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TagReturn build() => _build();

  _$TagReturn _build() {
    final _$result = _$v ??
        _$TagReturn._(
          id: BuiltValueNullFieldError.checkNotNull(id, r'TagReturn', 'id'),
          tag: BuiltValueNullFieldError.checkNotNull(tag, r'TagReturn', 'tag'),
          tagType: BuiltValueNullFieldError.checkNotNull(
              tagType, r'TagReturn', 'tagType'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
