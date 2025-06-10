import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:dragonhorde_client_flutter/api_provider.dart';
import 'package:dragonhorde_client_flutter/models/media_grid_item.dart';
import 'package:dragonhorde_client_flutter/util/value_notifier_list.dart';
import 'package:dragonhorde_client_flutter/widgets/grid_item.dart';
import 'package:dragonhorde_client_flutter/widgets/thumbnail.dart';
import 'package:dragonhorde_client_flutter/item.dart';
import 'package:flutter_reorderable_grid_view/widgets/reorderable_builder.dart';
import 'package:openapi/openapi.dart';

import 'package:flutter/material.dart';

enum CollectionItemType { thumbnail, child }

class CollectionItem extends StatelessWidget {
  final Widget child;
  final int id;
  final CollectionItemType type;

  const CollectionItem({super.key, required this.child, required this.id, required this.type});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class CollectionGrid extends StatefulWidget {
  const CollectionGrid({
    super.key,
    required this.collection,
    required this.onRemove,
    required this.onReorder,
    required this.nonDraggable,
  });
  final List<CollectionItem> collection;
  final List<int> nonDraggable;
  final void Function(int) onRemove;
  final void Function(ReorderedListFunction) onReorder;

  @override
  State<CollectionGrid> createState() => _CollectionGridState();
}

class _CollectionGridState extends State<CollectionGrid> {
  final _scrollController = ScrollController();
  final _gridViewKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableBuilder(
      scrollController: _scrollController,
      onReorder: widget.onReorder,
      nonDraggableIndices: widget.nonDraggable,
      builder: (children) {
        return GridView(
          key: _gridViewKey,
          controller: _scrollController,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            crossAxisSpacing: 30,
            mainAxisSpacing: 30,
            maxCrossAxisExtent: 250,
          ),
          children: children,
        );
      },
      enableLongPress: false,
      children: widget.collection,
    );
  }
}

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key, required this.id});
  final int id;

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> with AutomaticKeepAliveClientMixin<CollectionPage> {
  final ValueNotifierList<CollectionItem> _children = ValueNotifierList([]);
  final List<int> _nonDraggable = [];

  ValueNotifier<ApiCollection?> collection = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    _loadMedia();
  }

  void _loadMedia() async {
    Response<ApiCollection> results = await apiClient.getCollectionApi().getCollectionId(id: widget.id);
    collection.value = results.data!;
    if (results.data != null) {
      if (results.data!.children != null) {
        for (var i in results.data!.children!) {
          _children.add(
            CollectionItem(
              id: i.id!,
              type: CollectionItemType.child,
              key: ValueKey("collection_child_${i.id!}"),
              child: ContextMenuGridItem(
                id: i.id!,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CollectionPage(id: i.id!)));
                },
                contextMenuItems: [
                  // ContextMenuGridOptions(
                  //   name: "Remove",
                  //   onPress: () {
                  //     widget.onRemove(widget.collection[index]);
                  //   },
                  // ),
                ],
                child: Center(child: Text(i.name!)),
              ),
            ),
          );
          _nonDraggable.add(_children.value.length - 1);
        }
      }
      if (results.data!.media != null) {
        for (var m in results.data!.media!) {
          _children.add(
            CollectionItem(
              id: m,
              type: CollectionItemType.thumbnail,
              key: ValueKey("collection_item_$m"),
              child: ContextMenuGridItem(
                id: m,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ItemPage(enableSearch: false, item: MediaItemModel.fromId(m, null),)),
                  );
                },
                contextMenuItems: [
                  ContextMenuGridOptions(
                    name: "Remove",
                    onPress: () {
                      _mediaRemove(media: m);
                    },
                  ),
                ],
                child: Thumbnail(id: m),
              ),
            ),
          );
        }
      }
    }

    debugPrint(_children.value.toString());
  }

  static void _updateMedia(int id, List<CollectionItem> media) async {
    List<int> tmpMedia =
        (media.map((CollectionItem item) {
          if (item.type == CollectionItemType.thumbnail) return item.id;
          return null;
        })).whereType<int>().toList();
    await apiClient.getCollectionApi().patchCollectionId(
      id: id,
      apiCollection: ApiCollection((b) => b..media = ListBuilder(tmpMedia)),
    );
  }

  Future<String?> _mediaRemove({required media}) async {
    List<int> tmpMedia =
        (_children.value.map((CollectionItem item) {
          if (item.type == CollectionItemType.thumbnail) return item.id;
          return null;
        })).whereType<int>().toList();
    tmpMedia.remove(media);
    debugPrint(tmpMedia.toString());
    Response<ApiCollection> results = await apiClient.getCollectionApi().patchCollectionId(
      id: widget.id,
      apiCollection: ApiCollection((b) => b..media = ListBuilder(tmpMedia)),
    );
    if (results.statusCode != 200) {
      return results.statusMessage;
    }
    _children.remove(
      _children.value.firstWhere((item) => (item.type == CollectionItemType.thumbnail && item.id == media)),
    );
    return null;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: ValueListenableBuilder<ApiCollection?>(
              valueListenable: collection,
              builder: (BuildContext context, ApiCollection? value, Widget? child) {
                return (value != null)
                    ? Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Flexible(
                          flex: 3,
                          child: ListView(
                            padding: const EdgeInsets.all(10),
                            children: <Widget>[BackButton(), Center(child: Text(value.name!))],
                          ),
                        ),
                        Expanded(
                          flex: 14,
                          child: ValueListenableBuilder<List<CollectionItem>>(
                            valueListenable: _children,
                            builder: (BuildContext context, List<CollectionItem> value, Widget? child) {
                              return CollectionGrid(
                                nonDraggable: _nonDraggable,
                                collection: value,
                                onRemove: (id) {
                                  _mediaRemove(media: id);
                                },
                                onReorder: (ReorderedListFunction reorderedListFunction) {
                                  setState(() {
                                    _children.value = reorderedListFunction(_children.value) as List<CollectionItem>;
                                    _updateMedia(widget.id, _children.value);
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    )
                    : Center(child: CircularProgressIndicator());
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
