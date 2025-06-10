//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:openapi/src/date_serializer.dart';
import 'package:openapi/src/model/date.dart';

import 'package:openapi/src/model/add_item.dart';
import 'package:openapi/src/model/add_query.dart';
import 'package:openapi/src/model/api_collection.dart';
import 'package:openapi/src/model/api_creator.dart';
import 'package:openapi/src/model/api_media.dart';
import 'package:openapi/src/model/collection_result.dart';
import 'package:openapi/src/model/creators_results.dart';
import 'package:openapi/src/model/search_result.dart';
import 'package:openapi/src/model/tag_return.dart';

part 'serializers.g.dart';

@SerializersFor([
  AddItem,
  AddQuery,
  ApiCollection,
  ApiCreator,
  ApiMedia,
  CollectionResult,
  CreatorsResults,
  SearchResult,
  TagReturn,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(int)]),
        () => ListBuilder<int>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(TagReturn)]),
        () => ListBuilder<TagReturn>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(String)]),
        () => ListBuilder<String>(),
      )
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer())
    ).build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
