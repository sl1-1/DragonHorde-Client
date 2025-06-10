// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_collection.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiCollection extends ApiCollection {
  @override
  final BuiltList<ApiCollection>? children;
  @override
  final DateTime? created;
  @override
  final BuiltList<String>? creators;
  @override
  final String? description;
  @override
  final int? id;
  @override
  final BuiltList<int>? media;
  @override
  final String? name;
  @override
  final int? parent;
  @override
  final BuiltMap<String, BuiltList<String>>? tagGroups;

  factory _$ApiCollection([void Function(ApiCollectionBuilder)? updates]) =>
      (ApiCollectionBuilder()..update(updates))._build();

  _$ApiCollection._(
      {this.children,
      this.created,
      this.creators,
      this.description,
      this.id,
      this.media,
      this.name,
      this.parent,
      this.tagGroups})
      : super._();
  @override
  ApiCollection rebuild(void Function(ApiCollectionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiCollectionBuilder toBuilder() => ApiCollectionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiCollection &&
        children == other.children &&
        created == other.created &&
        creators == other.creators &&
        description == other.description &&
        id == other.id &&
        media == other.media &&
        name == other.name &&
        parent == other.parent &&
        tagGroups == other.tagGroups;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, children.hashCode);
    _$hash = $jc(_$hash, created.hashCode);
    _$hash = $jc(_$hash, creators.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, media.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, parent.hashCode);
    _$hash = $jc(_$hash, tagGroups.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ApiCollection')
          ..add('children', children)
          ..add('created', created)
          ..add('creators', creators)
          ..add('description', description)
          ..add('id', id)
          ..add('media', media)
          ..add('name', name)
          ..add('parent', parent)
          ..add('tagGroups', tagGroups))
        .toString();
  }
}

class ApiCollectionBuilder
    implements Builder<ApiCollection, ApiCollectionBuilder> {
  _$ApiCollection? _$v;

  ListBuilder<ApiCollection>? _children;
  ListBuilder<ApiCollection> get children =>
      _$this._children ??= ListBuilder<ApiCollection>();
  set children(ListBuilder<ApiCollection>? children) =>
      _$this._children = children;

  DateTime? _created;
  DateTime? get created => _$this._created;
  set created(DateTime? created) => _$this._created = created;

  ListBuilder<String>? _creators;
  ListBuilder<String> get creators =>
      _$this._creators ??= ListBuilder<String>();
  set creators(ListBuilder<String>? creators) => _$this._creators = creators;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  ListBuilder<int>? _media;
  ListBuilder<int> get media => _$this._media ??= ListBuilder<int>();
  set media(ListBuilder<int>? media) => _$this._media = media;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _parent;
  int? get parent => _$this._parent;
  set parent(int? parent) => _$this._parent = parent;

  MapBuilder<String, BuiltList<String>>? _tagGroups;
  MapBuilder<String, BuiltList<String>> get tagGroups =>
      _$this._tagGroups ??= MapBuilder<String, BuiltList<String>>();
  set tagGroups(MapBuilder<String, BuiltList<String>>? tagGroups) =>
      _$this._tagGroups = tagGroups;

  ApiCollectionBuilder() {
    ApiCollection._defaults(this);
  }

  ApiCollectionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _children = $v.children?.toBuilder();
      _created = $v.created;
      _creators = $v.creators?.toBuilder();
      _description = $v.description;
      _id = $v.id;
      _media = $v.media?.toBuilder();
      _name = $v.name;
      _parent = $v.parent;
      _tagGroups = $v.tagGroups?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiCollection other) {
    _$v = other as _$ApiCollection;
  }

  @override
  void update(void Function(ApiCollectionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiCollection build() => _build();

  _$ApiCollection _build() {
    _$ApiCollection _$result;
    try {
      _$result = _$v ??
          _$ApiCollection._(
            children: _children?.build(),
            created: created,
            creators: _creators?.build(),
            description: description,
            id: id,
            media: _media?.build(),
            name: name,
            parent: parent,
            tagGroups: _tagGroups?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'children';
        _children?.build();

        _$failedField = 'creators';
        _creators?.build();

        _$failedField = 'media';
        _media?.build();

        _$failedField = 'tagGroups';
        _tagGroups?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiCollection', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
