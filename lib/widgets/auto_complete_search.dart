import 'package:dragonhorde_client_flutter/api_provider.dart';

import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:dio/dio.dart';
import 'package:built_collection/built_collection.dart';

class TagTypeChoice extends StatefulWidget {
  const TagTypeChoice({super.key, this.onSelectionChanged});
  final void Function(TagSearchType)? onSelectionChanged;

  @override
  State<TagTypeChoice> createState() => TagTypeChoiceState();
}

// ignore: constant_identifier_names
enum TagSearchType { All, Tag, Artist, Collection }

class TagTypeChoiceState extends State<TagTypeChoice> {
  TagSearchType choice = TagSearchType.All;
  @override
  Widget build(BuildContext context) {
    return SegmentedButton<TagSearchType>(
      segments: const <ButtonSegment<TagSearchType>>[
        // ButtonSegment<TagSearchType>(
        //   value: TagSearchType.all,
        //   label: Text('All'),
        //   // icon: Icon(Icons.calendar_view_day),
        // ),
        ButtonSegment<TagSearchType>(
          value: TagSearchType.Tag,
          icon: Icon(Icons.sell),
        ),
        ButtonSegment<TagSearchType>(
          value: TagSearchType.Artist,
          icon: Icon(Icons.person),
        ),
        ButtonSegment<TagSearchType>(
          value: TagSearchType.Collection,
          icon: Icon(Icons.folder),
        ),
      ],
      selected: <TagSearchType>{choice},
      emptySelectionAllowed: true,
      showSelectedIcon: false,
      onSelectionChanged: (Set<TagSearchType> newSelection) {
        setState(() {
          if (newSelection.isNotEmpty) {
            choice = newSelection.first;
          } else {
            choice = TagSearchType.All;
          }
          if (widget.onSelectionChanged != null) {
            widget.onSelectionChanged!(choice);
          }
        });
      },
    );
  }
}

class TagSearchAutocomplete extends StatefulWidget {
  const TagSearchAutocomplete({super.key, required this.onSubmitted, this.searchType = TagSearchType.All, this.onNew});
  final Function(TagReturn) onSubmitted;
  final TagSearchType searchType;
  final Future<String?> Function(String)? onNew;

  @override
  State<TagSearchAutocomplete> createState() => _TagSearchAutocompleteState();
}

class _TagSearchAutocompleteState extends State<TagSearchAutocomplete> {
  // The query currently being searched for. If null, there is no pending
  // request.
  String? _searchingWithQuery;
  final Openapi _client = apiClient;

  // The most recent options received from the API.
  late Iterable<TagReturn> _lastOptions = <TagReturn>[];

  TextEditingController fieldTextEditingController = TextEditingController();
  FocusNode fieldFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<TagReturn>(
      textEditingController: fieldTextEditingController,
      focusNode: fieldFocusNode,
      optionsBuilder: (TextEditingValue textEditingValue) async {
        _searchingWithQuery = textEditingValue.text;

        Response<BuiltList<TagReturn>> response = await _client.getTagsApi().autocomplete(
          tag: _searchingWithQuery!,
          tagType: widget.searchType.name,
        );
        List<TagReturn> options = response.data!.toList();
        if (widget.onNew != null && _searchingWithQuery!.isNotEmpty) {
          //Dumb way to do this, but it works for now
          options.insert(
            0,
            TagReturn(
              (b) =>
                  b
                    ..tag = ""
                    ..tagType = TagReturnTagTypeEnum.tag,
            ),
          );
        }
        // If another search happened after this one, throw away these options.
        // Use the previous options instead and wait for the newer request to
        // finish.
        if (_searchingWithQuery != textEditingValue.text) {
          return _lastOptions;
        }

        _lastOptions = options;
        return options;
      },
      displayStringForOption: (tag) {
        return tag.tag;
      },
      optionsViewBuilder: (
        BuildContext context,
        AutocompleteOnSelected<TagReturn> onSelected,
        Iterable<TagReturn> options,
      ) {
        List<ListTile> children =
            options.map((TagReturn option) {
              IconData icon;
              switch (option.tagType) {
                case TagReturnTagTypeEnum.artist:
                  icon = Icons.person;
                  break;
                case TagReturnTagTypeEnum.collection:
                  icon = Icons.folder;
                  break;
                case TagReturnTagTypeEnum.tag:
                  icon = Icons.sell;
                  break;
                default:
                  icon = Icons.sell;
              }
              return ListTile(
                leading: Icon(icon),
                title: Text(option.tag),
                onTap: () {
                  // Handle the selection of an option
                  onSelected(option);
                },
              );
            }).toList();
        if (widget.onNew != null && _searchingWithQuery!.isNotEmpty) {
          IconData icon;
          switch (widget.searchType) {
            case TagSearchType.Artist:
              icon = Icons.person_add;
              break;
            case TagSearchType.Collection:
              icon = Icons.create_new_folder;
              break;
            case TagSearchType.Tag:
              icon = Icons.sell;
              break;
            default:
              icon = Icons.sell;
          }
          //Dumb way to do this, but it works for now
          children[0] = ListTile(
            leading: Icon(icon),
            title: Text(_searchingWithQuery!),
            onTap: () async {
              var result = await widget.onNew!(_searchingWithQuery!);
              if (result != null){
              widget.onSubmitted(
                TagReturn(
                  (b) =>
                      b
                        ..tag = result
                        ..tagType = switch (widget.searchType) {
                          TagSearchType.All => throw UnimplementedError(),
                          TagSearchType.Tag => TagReturnTagTypeEnum.tag,
                          TagSearchType.Artist => TagReturnTagTypeEnum.artist,
                          TagSearchType.Collection => TagReturnTagTypeEnum.collection,
                        },
                ),
              );
              }
            },
          );
        }

        return Material(elevation: 4.0, child: ListView(children: children));
      },
      fieldViewBuilder: (
        BuildContext context,
        TextEditingController fieldTextEditingController,
        FocusNode fieldFocusNode,
        VoidCallback onFieldSubmitted,
      ) {
        // Implement the text field UI

        return TextField(
          controller: fieldTextEditingController,
          focusNode: fieldFocusNode,
          decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'Search'),
          onSubmitted: (text) {
            widget.onSubmitted(
              TagReturn(
                (b) =>
                    b
                      ..tag = text
                      ..tagType = TagReturnTagTypeEnum.tag,
              ),
            );
            fieldTextEditingController.clear();
          },
        );
      },
      onSelected: (TagReturn selection) {
        widget.onSubmitted(selection);
        fieldTextEditingController.clear();
      },
    );
  }
}

enum TagType { tag, notTag, artist, collection }
