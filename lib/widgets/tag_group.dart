import 'package:dragonhorde_client_flutter/providers/search_provider.dart';
import 'package:dragonhorde_client_flutter/widgets/add_widget.dart';
import 'package:dragonhorde_client_flutter/widgets/auto_complete_search.dart';
import 'package:dragonhorde_client_flutter/widgets/context_menu.dart';

import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:url_launcher/url_launcher.dart';

class TagGroup extends StatelessWidget {
  final String group;
  final List<TagReturn> tags;
  final Function(TagReturn)? onDelete;
  final SearchProvider? search;
  final Function(String)? onNew;
  final Function(String)? onAdd;
  final TagSearchType? type;

  // final VoidCallback onPressed;
  const TagGroup({super.key, required this.group, required this.tags, this.onDelete, this.search, this.onNew, this.onAdd, this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: 
              AddWidget(
                icon: Icon(Icons.add),
                text: group,
                onNew: onNew,
                onAdd: onAdd,
                type: type,
              ),
        ),
        Wrap(
          spacing: 5,
          runSpacing: 5,
          alignment: WrapAlignment.spaceEvenly,
          children: [
            for (var tag in tags)
              ContextMenu(
                contextMenuBuilder: (BuildContext context, Offset offset) {
                  return AdaptiveTextSelectionToolbar.buttonItems(
                    anchors: TextSelectionToolbarAnchors(primaryAnchor: offset),
                    buttonItems: <ContextMenuButtonItem>[
                      if (Uri.tryParse(tag.tag)?.hasAbsolutePath ?? false)
                        ContextMenuButtonItem(
                          onPressed: () {
                            ContextMenuController.removeAny();
                            launchUrl(Uri.tryParse(tag.tag)!);
                          },
                          label: 'Open',
                        ),
                      if (search != null)
                        ContextMenuButtonItem(
                          onPressed: () {
                            ContextMenuController.removeAny();
                            search!.addTag(tag: tag);
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Center(child: AlertDialog(title: Text("${tag.tag} added to search")));
                              },
                            );
                          },
                          label: 'Add To Search',
                        ),
                      if (search != null)
                        ContextMenuButtonItem(
                          onPressed: () {
                            ContextMenuController.removeAny();
                            search!.addTag(
                              tag: TagReturn(
                                (b) =>
                                    b
                                      ..tag = "-${tag.tag}"
                                      ..tagType = tag.tagType,
                              ),
                            );
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Center(child: AlertDialog(title: Text("${tag.tag} blocked from search")));
                              },
                            );
                          },
                          label: 'Block from Search',
                        ),
                    ],
                  );
                },
                child: InputChip(
                  visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  deleteIconColor: Theme.of(context).colorScheme.onSecondary,
                  avatar:
                      tag.tag.startsWith("-") ? Icon(Icons.block, color: Theme.of(context).colorScheme.onError) : null,
                  label: Text(
                    style: DefaultTextStyle.of(context).style.apply(color: Theme.of(context).colorScheme.onSecondary),
                    tag.tag.startsWith("-") ? tag.tag.substring(1) : tag.tag,
                  ),
                  onDeleted: () {
                    if (onDelete != null) {
                      onDelete!(tag);
                    }
                  },
                ),
              ),
          ],
        ),
      ],
    );
  }
}
