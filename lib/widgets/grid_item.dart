import 'package:dragonhorde_client_flutter/widgets/context_menu.dart';
import 'package:flutter/material.dart';

class ContextMenuGridOptions {
  final String name;
  final void Function() onPress;
  ContextMenuGridOptions({required this.name, required this.onPress});
}

class ContextMenuGridItem extends StatelessWidget {
  final Widget child;
  final int id;
  final List<ContextMenuButtonItem> contextButtons = [];
  final void Function()? onTap;
  final MaterialPageRoute? route;

  ContextMenuGridItem({
    super.key,
    required this.child,
    required this.id,
    List<ContextMenuGridOptions>? contextMenuItems,
    this.onTap,
    this.route,
  }) {
    if (contextMenuItems != null) {
      for (var button in contextMenuItems) {
        contextButtons.add(
          ContextMenuButtonItem(
            onPressed: () {
              ContextMenuController.removeAny();
              button.onPress();
            },
            label: button.name,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ContextMenu(
      key: ValueKey("grid_item_$id"),
      contextMenuBuilder: (BuildContext context, Offset offset) {
        return AdaptiveTextSelectionToolbar.buttonItems(
          anchors: TextSelectionToolbarAnchors(primaryAnchor: offset),
          buttonItems: contextButtons,
        );
      },
      onTap: () {
        if (onTap != null) {
          onTap!();
        } else if (route != null) {
          Navigator.push(context, route!);
        }
      },
      child: child,
    );
  }
}
