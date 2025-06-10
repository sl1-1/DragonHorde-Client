import 'package:dragonhorde_client_flutter/models/metadata_model.dart';
import 'package:dragonhorde_client_flutter/providers/search_provider.dart';
import 'package:dragonhorde_client_flutter/widgets/add_metadata.dart';
import 'package:dragonhorde_client_flutter/widgets/context_menu.dart';

import 'package:flutter/material.dart';

class Metadata extends StatelessWidget {
  final MetadataContainer metadata;
  final SearchProvider? search;

  // final VoidCallback onPressed;
  const Metadata({super.key, required this.metadata, this.search});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(alignment: Alignment.centerLeft, child: AddMetadata(metadataContainer: metadata)),
        ListenableBuilder(
          listenable: metadata,
          builder: (context, child) {
            return Wrap(
              spacing: 5,
              runSpacing: 5,
              alignment: WrapAlignment.spaceEvenly,
              children: [
                for (var i in metadata.items)
                  ContextMenu(
                    contextMenuBuilder: i.contextMenu,
                    child:
                        metadata.canRemove || i.clickable
                            ? InputChip(
                              visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              backgroundColor: Theme.of(context).colorScheme.secondary,
                              disabledColor: Theme.of(context).colorScheme.secondary,
                              deleteIconColor: Theme.of(context).colorScheme.onSecondary,
                              label: Text(
                                style: DefaultTextStyle.of(
                                  context,
                                ).style.apply(color: Theme.of(context).colorScheme.onSecondary),
                                i.displayText,
                              ),
                              onDeleted: metadata.canRemove ? () => metadata.removeItem(i) : null,
                              onPressed: i.clickable ? (){i.onClick(context);}: null,
                              tooltip: i.toolTip(),
                            )
                            : Tooltip(message: i.toolTip(), child: Chip(
                              visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              backgroundColor: Theme.of(context).colorScheme.secondary,
                              label: Text(
                                style: DefaultTextStyle.of(
                                  context,
                                ).style.apply(color: Theme.of(context).colorScheme.onSecondary),
                                i.displayText,
                              ),
                            ),
                            ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
