// import 'dart:collection';

// import 'package:dragonhorde_client_flutter/models/grid_item.dart';
// import 'package:dragonhorde_client_flutter/util/value_notifier_list.dart';
// import 'package:dragonhorde_client_flutter/widgets/thumbnail.dart';

// import 'package:flutter/material.dart';
// import 'package:openapi/openapi.dart';

// class ThumbnailModel with ChangeNotifier {
//   final List<ApiMedia> _values = <ApiMedia>[];
//   UnmodifiableListView<ApiMedia> get items => UnmodifiableListView(_values);

//   void add(ApiMedia value) {
//     _values.add(value);
//     notifyListeners();
//   }

//   void addAll(List<ApiMedia> value) {
//     _values.addAll(value);
//     notifyListeners();
//   }
// }

// class ThumbnailGrid extends StatefulWidget {
//   final void Function(int index)? onTap;
//   final void Function(int pos) load;
//   final ThumbnailModel items;

//   const ThumbnailGrid({super.key, required this.items, required this.load, this.onTap});

//   @override
//   State<ThumbnailGrid> createState() => _ThumbnailGridState();
// }

// class _ThumbnailGridState extends State<ThumbnailGrid> {
//   late List<ApiMedia> items = [];
//   final ScrollController _scrollController = ScrollController();
//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(() {
//       //Load more when there is only two rows left
//       if (_scrollController.position.maxScrollExtent - _scrollController.position.pixels <= 500) {
//         widget.load(widget.items.items.length - 1);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListenableBuilder(
//       listenable: widget.items,
//       builder: (BuildContext context, Widget? child) {
//         return GridView.builder(
//           controller: _scrollController,
//           gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//             crossAxisSpacing: 30,
//             mainAxisSpacing: 30,
//             maxCrossAxisExtent: 250,
//           ),
//           itemCount: widget.items.items.length,
//           itemBuilder: (context, index) {
//             return Center(
//               child: GestureDetector(
//                 onTap: () {
//                   if (widget.onTap != null) {
//                     widget.onTap!(index);
//                   }
//                 },
//                 child: Thumbnail(id: widget.items.items[index].id!),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }

// class ModelGrid extends StatefulWidget {
//   final void Function(int index)? onTap;
//   final void Function(int pos) load;
//   final ValueNotifierList<GridItemModel> items;

//   const ModelGrid({super.key, required this.items, required this.load, this.onTap});

//   @override
//   State<ModelGrid> createState() => _ModelGridState();
// }

// class _ModelGridState extends State<ModelGrid> {
//   // late List<GridItemModel> items = [];
//   final ScrollController _scrollController = ScrollController();
//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(() {
//       //Load more when there is only two rows left
//       if (_scrollController.position.maxScrollExtent - _scrollController.position.pixels <= 500) {
//         widget.load(widget.items.value.length - 1);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListenableBuilder(
//       listenable: widget.items,
//       builder: (BuildContext context, Widget? child) {
//         return GridView.builder(
//           controller: _scrollController,
//           gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//             crossAxisSpacing: 30,
//             mainAxisSpacing: 30,
//             maxCrossAxisExtent: 250,
//           ),
//           itemCount: widget.items.value.length,
//           itemBuilder: (context, index) {
//             return Center(
//               child: GestureDetector(
//                 onTap: () {
//                   if (widget.onTap != null) {
//                     widget.onTap!(index);
//                   }
//                 },
//                 child: widget.items.value[index].thumbnail
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
