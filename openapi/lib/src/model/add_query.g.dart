// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_query.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddQuery extends AddQuery {
  @override
  final BuiltList<AddItem> media;

  factory _$AddQuery([void Function(AddQueryBuilder)? updates]) =>
      (AddQueryBuilder()..update(updates))._build();

  _$AddQuery._({required this.media}) : super._();
  @override
  AddQuery rebuild(void Function(AddQueryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddQueryBuilder toBuilder() => AddQueryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddQuery && media == other.media;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, media.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddQuery')..add('media', media))
        .toString();
  }
}

class AddQueryBuilder implements Builder<AddQuery, AddQueryBuilder> {
  _$AddQuery? _$v;

  ListBuilder<AddItem>? _media;
  ListBuilder<AddItem> get media => _$this._media ??= ListBuilder<AddItem>();
  set media(ListBuilder<AddItem>? media) => _$this._media = media;

  AddQueryBuilder() {
    AddQuery._defaults(this);
  }

  AddQueryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _media = $v.media.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddQuery other) {
    _$v = other as _$AddQuery;
  }

  @override
  void update(void Function(AddQueryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddQuery build() => _build();

  _$AddQuery _build() {
    _$AddQuery _$result;
    try {
      _$result = _$v ??
          _$AddQuery._(
            media: media.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'media';
        media.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AddQuery', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
