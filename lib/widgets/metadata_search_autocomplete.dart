import 'package:dragonhorde_client_flutter/models/metadata_model.dart';

import 'package:flutter/material.dart';

class MetadataSearchItem {
  final MetadataItemModel item;
  final Future<MetadataItemModel?> Function()? onSelected;
  MetadataSearchItem({required this.item, this.onSelected});
  @override
  String toString() => item.displayText;
}

class MetadataSearchAutocomplete extends StatefulWidget {
  const MetadataSearchAutocomplete({super.key, required this.metadataContainer});
  final MetadataContainer metadataContainer;

  @override
  State<MetadataSearchAutocomplete> createState() => _MetadataSearchAutocompleteState();
}

class _MetadataSearchAutocompleteState extends State<MetadataSearchAutocomplete> {
  // The query currently being searched for. If null, there is no pending
  // request.
  String? _searchingWithQuery;

  // The most recent options received from the API.
  late Iterable<MetadataSearchItem> _lastOptions = <MetadataSearchItem>[];

  TextEditingController fieldTextEditingController = TextEditingController();
  FocusNode fieldFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<MetadataSearchItem>(
      textEditingController: fieldTextEditingController,
      focusNode: fieldFocusNode,
      optionsBuilder: (TextEditingValue textEditingValue) async {
        _searchingWithQuery = textEditingValue.text;

        if (_searchingWithQuery != null) {
          List<MetadataItemModel>? results = await widget.metadataContainer.autoComplete(_searchingWithQuery!);
          if (results != null) {
            // If another search happened after this one, throw away these options.
            // Use the previous options instead and wait for the newer request to
            // finish.
            if (_searchingWithQuery == textEditingValue.text) {
              List<MetadataSearchItem> options = results.map((m) => MetadataSearchItem(item: m)).toList();
              if (widget.metadataContainer.canAdd && _searchingWithQuery!.isNotEmpty) {
                options.insert(
                  0,
                  MetadataSearchItem(
                    item: widget.metadataContainer.newItemInstance(_searchingWithQuery!),
                    onSelected: () async {
                      var ret = await showDialog<MetadataItemModel>(
                        context: context,
                        builder: (BuildContext context) {
                          return widget.metadataContainer.newItem(context, _searchingWithQuery!);
                        },
                      );
                      return ret;
                    },
                  ),
                );
              }
              _lastOptions = options;
              return options;
            }
          }
          return _lastOptions;
        } else {
          return _lastOptions;
        }
      },
      optionsViewBuilder: (
        BuildContext context,
        AutocompleteOnSelected<MetadataSearchItem> onSelected,
        Iterable<MetadataSearchItem> options,
      ) {
        List<ListTile> children =
            options.map((MetadataSearchItem option) {
              return ListTile(
                leading: option.onSelected != null ? Icon(Icons.add) : option.item.icon,
                title: Text(option.item.displayText),
                onTap: () {
                  onSelected(option);
                },
              );
            }).toList();
        return Material(elevation: 4.0, child: ListView(children: children));
      },
      fieldViewBuilder: (
        BuildContext context,
        TextEditingController fieldTextEditingController,
        FocusNode fieldFocusNode,
        VoidCallback onFieldSubmitted,
      ) {
        // Implement the text field UI
        return TextFormField(
          controller: fieldTextEditingController,
          focusNode: fieldFocusNode,
          decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'Search'),
          onFieldSubmitted: (text) {
            onFieldSubmitted();
          },
        );
      },
      onSelected: (MetadataSearchItem selection) async {
        debugPrint(selection.item.displayText);
        if (selection.onSelected != null) {
          var result = await selection.onSelected!();
          if (result != null) {
            debugPrint(result.displayText);
          } else {
            return;
          }
        }
        var result = await widget.metadataContainer.addItem(selection.item);
        if (result == null) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Adding ${selection.item.displayText} to ${widget.metadataContainer.name} Failed'),
              ),
            );
          }
        }
      },
    );
  }
}
