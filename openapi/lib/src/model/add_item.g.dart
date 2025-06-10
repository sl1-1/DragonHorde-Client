// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddItem extends AddItem {
  @override
  final int mediaId;
  @override
  final int ord;

  factory _$AddItem([void Function(AddItemBuilder)? updates]) =>
      (AddItemBuilder()..update(updates))._build();

  _$AddItem._({required this.mediaId, required this.ord}) : super._();
  @override
  AddItem rebuild(void Function(AddItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddItemBuilder toBuilder() => AddItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddItem && mediaId == other.mediaId && ord == other.ord;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, mediaId.hashCode);
    _$hash = $jc(_$hash, ord.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddItem')
          ..add('mediaId', mediaId)
          ..add('ord', ord))
        .toString();
  }
}

class AddItemBuilder implements Builder<AddItem, AddItemBuilder> {
  _$AddItem? _$v;

  int? _mediaId;
  int? get mediaId => _$this._mediaId;
  set mediaId(int? mediaId) => _$this._mediaId = mediaId;

  int? _ord;
  int? get ord => _$this._ord;
  set ord(int? ord) => _$this._ord = ord;

  AddItemBuilder() {
    AddItem._defaults(this);
  }

  AddItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _mediaId = $v.mediaId;
      _ord = $v.ord;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddItem other) {
    _$v = other as _$AddItem;
  }

  @override
  void update(void Function(AddItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddItem build() => _build();

  _$AddItem _build() {
    final _$result = _$v ??
        _$AddItem._(
          mediaId: BuiltValueNullFieldError.checkNotNull(
              mediaId, r'AddItem', 'mediaId'),
          ord: BuiltValueNullFieldError.checkNotNull(ord, r'AddItem', 'ord'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
