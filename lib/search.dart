import 'package:dragonhorde_client_flutter/providers/search_provider.dart';
import 'package:dragonhorde_client_flutter/widgets/auto_complete_search.dart';
import 'package:dragonhorde_client_flutter/widgets/pageinated_grid.dart';
import 'package:dragonhorde_client_flutter/widgets/tag_group.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with AutomaticKeepAliveClientMixin<SearchPage> {
  final ScrollController _scrollController = ScrollController(initialScrollOffset: 5.0);

  final fieldText = TextEditingController();
  ValueNotifier<TagSearchType> tagSearchSelection = ValueNotifier<TagSearchType>(TagSearchType.All);

  @override
  void initState() {
    super.initState();
    Provider.of<SearchProvider>(context, listen: false).search();
    _scrollController.addListener(_scrollListener);
  }

  _scrollListener() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        Provider.of<SearchProvider>(context, listen: false).more();
      });
    }
  }

  void _deleteTag(TagReturn tag) {
    Provider.of<SearchProvider>(context, listen: false).deleteTag(tag: tag);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Consumer<SearchProvider>(
              builder: (context, results, child) {
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Flexible(
                      flex: 3,
                      child: ListView(
                        padding: const EdgeInsets.all(10),
                        children: <Widget>[
                          Card(
                            child: TagTypeChoice(
                              onSelectionChanged: (TagSearchType type) {
                                tagSearchSelection.value = type;
                              },
                            ),
                          ),
                          ValueListenableBuilder<TagSearchType>(
                            valueListenable: tagSearchSelection,
                            builder: (BuildContext context, TagSearchType value, child) {
                              return TagSearchAutocomplete(
                                searchType: value,
                                onSubmitted: (TagReturn value) async {
                                  results.addTag(tag: value);
                                  fieldText.clear();
                                },
                              );
                            },
                          ),

                          if (results.artists.isNotEmpty)
                            TagGroup(group: "Artist", tags: results.artists, onDelete: _deleteTag),
                          if (results.tags.isNotEmpty)
                            TagGroup(group: "Tags", tags: results.tags, onDelete: _deleteTag),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 14,
                      child: ModelGrid(
                        items: results.items,
                        onTap: (index) {
                          results.items.value[index].navigate(context);
                        },
                        load: (pos) {
                          results.more();
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
