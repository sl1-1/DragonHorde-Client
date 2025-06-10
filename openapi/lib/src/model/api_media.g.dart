// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_media.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiMedia extends ApiMedia {
  @override
  final BuiltList<String>? collections;
  @override
  final BuiltMap<String, String>? collectionsWithId;
  @override
  final DateTime? created;
  @override
  final BuiltList<String>? creators;
  @override
  final String? description;
  @override
  final double? distance;
  @override
  final int? id;
  @override
  final int? perceptualHash;
  @override
  final String? sha256;
  @override
  final BuiltList<String>? sources;
  @override
  final String? storageUri;
  @override
  final BuiltMap<String, BuiltList<String>>? tagGroups;
  @override
  final String? title;
  @override
  final DateTime? uploaded;

  factory _$ApiMedia([void Function(ApiMediaBuilder)? updates]) =>
      (ApiMediaBuilder()..update(updates))._build();

  _$ApiMedia._(
      {this.collections,
      this.collectionsWithId,
      this.created,
      this.creators,
      this.description,
      this.distance,
      this.id,
      this.perceptualHash,
      this.sha256,
      this.sources,
      this.storageUri,
      this.tagGroups,
      this.title,
      this.uploaded})
      : super._();
  @override
  ApiMedia rebuild(void Function(ApiMediaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiMediaBuilder toBuilder() => ApiMediaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiMedia &&
        collections == other.collections &&
        collectionsWithId == other.collectionsWithId &&
        created == other.created &&
        creators == other.creators &&
        description == other.description &&
        distance == other.distance &&
        id == other.id &&
        perceptualHash == other.perceptualHash &&
        sha256 == other.sha256 &&
        sources == other.sources &&
        storageUri == other.storageUri &&
        tagGroups == other.tagGroups &&
        title == other.title &&
        uploaded == other.uploaded;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, collections.hashCode);
    _$hash = $jc(_$hash, collectionsWithId.hashCode);
    _$hash = $jc(_$hash, created.hashCode);
    _$hash = $jc(_$hash, creators.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, distance.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, perceptualHash.hashCode);
    _$hash = $jc(_$hash, sha256.hashCode);
    _$hash = $jc(_$hash, sources.hashCode);
    _$hash = $jc(_$hash, storageUri.hashCode);
    _$hash = $jc(_$hash, tagGroups.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, uploaded.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ApiMedia')
          ..add('collections', collections)
          ..add('collectionsWithId', collectionsWithId)
          ..add('created', created)
          ..add('creators', creators)
          ..add('description', description)
          ..add('distance', distance)
          ..add('id', id)
          ..add('perceptualHash', perceptualHash)
          ..add('sha256', sha256)
          ..add('sources', sources)
          ..add('storageUri', storageUri)
          ..add('tagGroups', tagGroups)
          ..add('title', title)
          ..add('uploaded', uploaded))
        .toString();
  }
}

class ApiMediaBuilder implements Builder<ApiMedia, ApiMediaBuilder> {
  _$ApiMedia? _$v;

  ListBuilder<String>? _collections;
  ListBuilder<String> get collections =>
      _$this._collections ??= ListBuilder<String>();
  set collections(ListBuilder<String>? collections) =>
      _$this._collections = collections;

  MapBuilder<String, String>? _collectionsWithId;
  MapBuilder<String, String> get collectionsWithId =>
      _$this._collectionsWithId ??= MapBuilder<String, String>();
  set collectionsWithId(MapBuilder<String, String>? collectionsWithId) =>
      _$this._collectionsWithId = collectionsWithId;

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

  double? _distance;
  double? get distance => _$this._distance;
  set distance(double? distance) => _$this._distance = distance;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _perceptualHash;
  int? get perceptualHash => _$this._perceptualHash;
  set perceptualHash(int? perceptualHash) =>
      _$this._perceptualHash = perceptualHash;

  String? _sha256;
  String? get sha256 => _$this._sha256;
  set sha256(String? sha256) => _$this._sha256 = sha256;

  ListBuilder<String>? _sources;
  ListBuilder<String> get sources => _$this._sources ??= ListBuilder<String>();
  set sources(ListBuilder<String>? sources) => _$this._sources = sources;

  String? _storageUri;
  String? get storageUri => _$this._storageUri;
  set storageUri(String? storageUri) => _$this._storageUri = storageUri;

  MapBuilder<String, BuiltList<String>>? _tagGroups;
  MapBuilder<String, BuiltList<String>> get tagGroups =>
      _$this._tagGroups ??= MapBuilder<String, BuiltList<String>>();
  set tagGroups(MapBuilder<String, BuiltList<String>>? tagGroups) =>
      _$this._tagGroups = tagGroups;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  DateTime? _uploaded;
  DateTime? get uploaded => _$this._uploaded;
  set uploaded(DateTime? uploaded) => _$this._uploaded = uploaded;

  ApiMediaBuilder() {
    ApiMedia._defaults(this);
  }

  ApiMediaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _collections = $v.collections?.toBuilder();
      _collectionsWithId = $v.collectionsWithId?.toBuilder();
      _created = $v.created;
      _creators = $v.creators?.toBuilder();
      _description = $v.description;
      _distance = $v.distance;
      _id = $v.id;
      _perceptualHash = $v.perceptualHash;
      _sha256 = $v.sha256;
      _sources = $v.sources?.toBuilder();
      _storageUri = $v.storageUri;
      _tagGroups = $v.tagGroups?.toBuilder();
      _title = $v.title;
      _uploaded = $v.uploaded;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiMedia other) {
    _$v = other as _$ApiMedia;
  }

  @override
  void update(void Function(ApiMediaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiMedia build() => _build();

  _$ApiMedia _build() {
    _$ApiMedia _$result;
    try {
      _$result = _$v ??
          _$ApiMedia._(
            collections: _collections?.build(),
            collectionsWithId: _collectionsWithId?.build(),
            created: created,
            creators: _creators?.build(),
            description: description,
            distance: distance,
            id: id,
            perceptualHash: perceptualHash,
            sha256: sha256,
            sources: _sources?.build(),
            storageUri: storageUri,
            tagGroups: _tagGroups?.build(),
            title: title,
            uploaded: uploaded,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'collections';
        _collections?.build();
        _$failedField = 'collectionsWithId';
        _collectionsWithId?.build();

        _$failedField = 'creators';
        _creators?.build();

        _$failedField = 'sources';
        _sources?.build();

        _$failedField = 'tagGroups';
        _tagGroups?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ApiMedia', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
