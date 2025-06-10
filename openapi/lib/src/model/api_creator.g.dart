// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_creator.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiCreator extends ApiCreator {
  @override
  final BuiltList<String>? aliases;
  @override
  final DateTime? created;
  @override
  final int? id;
  @override
  final String? name;

  factory _$ApiCreator([void Function(ApiCreatorBuilder)? updates]) =>
      (ApiCreatorBuilder()..update(updates))._build();

  _$ApiCreator._({this.aliases, this.created, this.id, this.name}) : super._();
  @override
  ApiCreator rebuild(void Function(ApiCreatorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiCreatorBuilder toBuilder() => ApiCreatorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiCreator &&
        aliases == other.aliases &&
        created == other.created &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, aliases.hashCode);
    _$hash = $jc(_$hash, created.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ApiCreator')
          ..add('aliases', aliases)
          ..add('created', created)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class ApiCreatorBuilder implements Builder<ApiCreator, ApiCreatorBuilder> {
  _$ApiCreator? _$v;

  ListBuilder<String>? _aliases;
  ListBuilder<String> get aliases => _$this._aliases ??= ListBuilder<String>();
  set aliases(ListBuilder<String>? aliases) => _$this._aliases = aliases;

  DateTime? _created;
  DateTime? get created => _$this._created;
  set created(DateTime? created) => _$this._created = created;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ApiCreatorBuilder() {
    ApiCreator._defaults(this);
  }

  ApiCreatorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _aliases = $v.aliases?.toBuilder();
      _created = $v.created;
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiCreator other) {
    _$v = other as _$ApiCreator;
  }

  @override
  void update(void Function(ApiCreatorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiCreator build() => _build();

  _$ApiCreator _build() {
    _$ApiCreator _$result;
    try {
      _$result = _$v ??
          _$ApiCreator._(
            aliases: _aliases?.build(),
            created: created,
            id: id,
            name: name,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'aliases';
        _aliases?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiCreator', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
