import 'package:dio/dio.dart';
import 'package:dragonhorde_client_flutter/api_provider.dart';
import 'package:dragonhorde_client_flutter/collection.dart';
import 'package:dragonhorde_client_flutter/models/collection_item_model.dart';
import 'package:dragonhorde_client_flutter/models/media_item.dart';
import 'package:dragonhorde_client_flutter/providers/creator_provider.dart';
import 'package:dragonhorde_client_flutter/util/value_notifier_list.dart';
import 'package:dragonhorde_client_flutter/widgets/pageinated_grid.dart';
import 'package:openapi/openapi.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class CreatorCollectionGrid extends StatefulWidget {
  final CreatorProvider creatorProvider;

  const CreatorCollectionGrid({super.key, required this.creatorProvider});

  @override
  State<CreatorCollectionGrid> createState() => _CreatorCollectionGridState();
}

class _CreatorCollectionGridState extends State<CreatorCollectionGrid> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _scrollController,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
        maxCrossAxisExtent: 250,
      ),
      itemCount: widget.creatorProvider.collections.length,
      itemBuilder: (context, index) {
        return Center(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CollectionPage(id: widget.creatorProvider.collections[index].id!),
                ),
              );
            },
            child: Text(widget.creatorProvider.collections[index].name!),
          ),
        );
      },
    );
  }
}

class CreatorPage extends StatefulWidget {
  const CreatorPage({super.key});

  @override
  State<CreatorPage> createState() => _CreatorPageState();
}

class _CreatorPageState extends State<CreatorPage> with TickerProviderStateMixin {
  ValueNotifierList<MediaItemModel> uncollected = ValueNotifierList([]);
  ValueNotifierList<MediaItemModel> allMedia = ValueNotifierList([]);
  ValueNotifierList<CollectionItemModel> collections = ValueNotifierList([]);

  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    Provider.of<CreatorProvider>(context, listen: false).addListener(() {
      loadAllMedia(Provider.of<CreatorProvider>(context, listen: false).id);
      loadUncollected(Provider.of<CreatorProvider>(context, listen: false).id);
      loadCollections(Provider.of<CreatorProvider>(context, listen: false).id);
    });
    debugPrint(collections.toString());
  }

  void loadUncollected(int id) async {
    Response<SearchResult> response = await apiClient.getCreatorsApi().getCreatorsUncollected(
      id: id,
      perPage: 20,
      last: 0,
    );
    uncollected.addAll(response.data!.result.map((i) => MediaItemModel.fromItem(i, null)).toList());
  }

  void loadAllMedia(int id) async {
    Response<SearchResult> response = await apiClient.getCreatorsApi().getCreatorsMedia(id: id, perPage: 20, last: 0);
    allMedia.addAll(response.data!.result.map((i) => MediaItemModel.fromItem(i, null)).toList());
  }

  void loadCollections(int id) async {
    Response<CollectionResult> response = await apiClient.getCreatorsApi().getCreatorsCollection(id: id);
    collections.addAll(response.data!.result.map((i) => CollectionItemModel.fromItem(i)).toList());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Consumer<CreatorProvider>(
              builder: (context, results, child) {
                return results.loading()
                    ? Center(child: CircularProgressIndicator())
                    : Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Flexible(
                          flex: 3,
                          child: ListView(
                            padding: const EdgeInsets.all(10),
                            children: <Widget>[BackButton(), Center(child: Text(results.name))],
                          ),
                        ),
                        Expanded(
                          flex: 14,
                          child: Column(
                            children: <Widget>[
                              TabBar.secondary(
                                controller: _tabController,
                                tabs: const <Widget>[
                                  Tab(text: 'Uncollected Media'),
                                  Tab(text: 'Collections'),
                                  Tab(text: 'All Media'),
                                ],
                              ),
                              Expanded(
                                child: TabBarView(
                                  controller: _tabController,
                                  children: <Widget>[
                                    Card(
                                      margin: const EdgeInsets.all(16.0),
                                      child: ModelGrid(
                                        load: (pos) async {
                                          Response<SearchResult> response = await apiClient
                                              .getCreatorsApi()
                                              .getCreatorsUncollected(id: results.id, perPage: 20, last: pos);
                                          uncollected.addAll(
                                            response.data!.result.map((i) => MediaItemModel.fromItem(i, null)).toList(),
                                          );
                                        },
                                        items: uncollected,
                                        onTap: (index) {
                                          uncollected.value[index].navigate(context);
                                        },
                                      ),
                                    ),
                                    Card(
                                      margin: const EdgeInsets.all(16.0),
                                      child: Center(
                                        child: ModelGrid(
                                          items: collections,
                                          load: (i) {},
                                          onTap: (index) => collections.value[index].navigate(context),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      margin: const EdgeInsets.all(16.0),
                                      child: Center(
                                        child: ModelGrid(
                                          load: (pos) async {
                                            Response<SearchResult> response = await apiClient
                                                .getCreatorsApi()
                                                .getCreatorsMedia(id: results.id, perPage: 20, last: pos);
                                            allMedia.addAll(
                                              response.data!.result
                                                  .map((i) => MediaItemModel.fromItem(i, null))
                                                  .toList(),
                                            );
                                          },
                                          items: allMedia,
                                          onTap: (index) {
                                            allMedia.value[index].navigate(context);
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
}
