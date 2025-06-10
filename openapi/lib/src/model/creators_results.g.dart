// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creators_results.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreatorsResults extends CreatorsResults {
  @override
  final BuiltList<ApiCreator> result;

  factory _$CreatorsResults([void Function(CreatorsResultsBuilder)? updates]) =>
      (CreatorsResultsBuilder()..update(updates))._build();

  _$CreatorsResults._({required this.result}) : super._();
  @override
  CreatorsResults rebuild(void Function(CreatorsResultsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreatorsResultsBuilder toBuilder() => CreatorsResultsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreatorsResults && result == other.result;
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
    return (newBuiltValueToStringHelper(r'CreatorsResults')
          ..add('result', result))
        .toString();
  }
}

class CreatorsResultsBuilder
    implements Builder<CreatorsResults, CreatorsResultsBuilder> {
  _$CreatorsResults? _$v;

  ListBuilder<ApiCreator>? _result;
  ListBuilder<ApiCreator> get result =>
      _$this._result ??= ListBuilder<ApiCreator>();
  set result(ListBuilder<ApiCreator>? result) => _$this._result = result;

  CreatorsResultsBuilder() {
    CreatorsResults._defaults(this);
  }

  CreatorsResultsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _result = $v.result.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreatorsResults other) {
    _$v = other as _$CreatorsResults;
  }

  @override
  void update(void Function(CreatorsResultsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreatorsResults build() => _build();

  _$CreatorsResults _build() {
    _$CreatorsResults _$result;
    try {
      _$result = _$v ??
          _$CreatorsResults._(
            result: result.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'result';
        result.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CreatorsResults', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
