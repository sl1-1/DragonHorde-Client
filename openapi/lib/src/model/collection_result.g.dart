// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_result.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CollectionResult extends CollectionResult {
  @override
  final BuiltList<ApiCollection> result;

  factory _$CollectionResult(
          [void Function(CollectionResultBuilder)? updates]) =>
      (CollectionResultBuilder()..update(updates))._build();

  _$CollectionResult._({required this.result}) : super._();
  @override
  CollectionResult rebuild(void Function(CollectionResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CollectionResultBuilder toBuilder() =>
      CollectionResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CollectionResult && result == other.result;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, result.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CollectionResult')
          ..add('result', result))
        .toString();
  }
}

class CollectionResultBuilder
    implements Builder<CollectionResult, CollectionResultBuilder> {
  _$CollectionResult? _$v;

  ListBuilder<ApiCollection>? _result;
  ListBuilder<ApiCollection> get result =>
      _$this._result ??= ListBuilder<ApiCollection>();
  set result(ListBuilder<ApiCollection>? result) => _$this._result = result;

  CollectionResultBuilder() {
    CollectionResult._defaults(this);
  }

  CollectionResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _result = $v.result.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CollectionResult other) {
    _$v = other as _$CollectionResult;
  }

  @override
  void update(void Function(CollectionResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CollectionResult build() => _build();

  _$CollectionResult _build() {
    _$CollectionResult _$result;
    try {
      _$result = _$v ??
          _$CollectionResult._(
            result: result.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'result';
        result.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CollectionResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
