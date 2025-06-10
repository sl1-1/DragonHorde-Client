import 'package:dragonhorde_client_flutter/models/grid_item.dart';
import 'package:dragonhorde_client_flutter/util/value_notifier_list.dart';
import 'package:flutter/material.dart';

class ModelGrid extends StatefulWidget {
  final void Function(int index)? onTap;
  final void Function(int pos) load;
  final ValueNotifierList<GridItemModel> items;

  const ModelGrid({super.key, required this.items, required this.load, this.onTap});

  @override
  State<ModelGrid> createState() => _ModelGridState();
}

class _ModelGridState extends State<ModelGrid> {
  // late List<GridItemModel> items = [];
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      //Load more when there is only two rows left
      if (_scrollController.position.maxScrollExtent - _scrollController.position.pixels <= 500) {
        widget.load(widget.items.value.length - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.items,
      builder: (BuildContext context, Widget? child) {
        return GridView.builder(
          controller: _scrollController,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            crossAxisSpacing: 30,
            mainAxisSpacing: 30,
            maxCrossAxisExtent: 250,
          ),
          itemCount: widget.items.value.length,
          itemBuilder: (context, index) {
            return Center(
              child: GestureDetector(
                onTap: () {
                  if (widget.onTap != null) {
                    widget.onTap!(index);
                  }
                },
                child: widget.items.value[index].thumbnail
              ),
            );
          },
        );
      },
    );
  }
}
