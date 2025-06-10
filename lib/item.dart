import 'package:dragonhorde_client_flutter/models/media_grid_item.dart';
import 'package:dragonhorde_client_flutter/providers/search_provider.dart';
import 'package:dragonhorde_client_flutter/widgets/image.dart';
import 'package:dragonhorde_client_flutter/widgets/metadata.dart';
import 'package:dragonhorde_client_flutter/widgets/tag_group.dart';

import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

class ItemPage extends StatefulWidget {
  final bool enableSearch;
  final SearchProvider? search;
  const ItemPage({super.key, required this.enableSearch, this.search, required this.item});
  // final int? id;
  final MediaItemModel item;

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  List<TagReturn> buildTags(List<String> input, TagReturnTagTypeEnum type) {
    return input.map((i) {
      return TagReturn(
        (b) =>
            b
              ..tag = i
              ..tagType = type
              ..id = 0
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListenableBuilder(
              listenable: widget.item,
              builder: (context, child) {
                return Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Flexible(
                          flex: 3,
                          child: ListView(
                            padding: const EdgeInsets.all(10),
                            children: <Widget>[
                              BackButton(),
                              
                              Metadata(metadata: widget.item.artists),
                              Metadata(metadata: widget.item.collections),
                              Metadata(metadata: widget.item.sources),
                              if (widget.item.tags.isNotEmpty)
                                for (var group in widget.item.tags.entries)
                                  TagGroup(
                                    group: group.key,
                                    tags: buildTags(group.value, TagReturnTagTypeEnum.tag),
                                    search: widget.search,
                                  ),
                            ],
                          ),
                        ),
                        Expanded(flex: 14, child: ApiImage(id: widget.item.id)),
                      ],
                    );
              },
            ),
          ),
        ],
      ),
    );
  }
}
