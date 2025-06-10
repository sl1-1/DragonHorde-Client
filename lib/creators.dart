import 'package:dio/dio.dart';
import 'package:dragonhorde_client_flutter/api_provider.dart';
import 'package:dragonhorde_client_flutter/models/creator_grid_item.dart';
import 'package:dragonhorde_client_flutter/util/value_notifier_list.dart';
import 'package:dragonhorde_client_flutter/widgets/pageinated_grid.dart';
import 'package:openapi/openapi.dart';

import 'package:flutter/material.dart';


class CreatorsPage extends StatefulWidget {
  const CreatorsPage({super.key});

  @override
  State<CreatorsPage> createState() => _CreatorsPageState();
}

class _CreatorsPageState extends State<CreatorsPage> with AutomaticKeepAliveClientMixin<CreatorsPage> {
  final ValueNotifierList<CreatorItemModel> _creators = ValueNotifierList([]);

  @override
  bool get wantKeepAlive => true;

  Future<void> load() async {
    Response<CreatorsResults> results = await apiClient.getCreatorsApi().getCreators();
    _creators.addAll(results.data!.result.map((i) => CreatorItemModel.fromItem(i)).toList());
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 14,
                  child: ValueListenableBuilder<List<CreatorItemModel>>(
                    valueListenable: _creators,
                    builder: (BuildContext context, List<CreatorItemModel> value, child) {
                      return ModelGrid(items: _creators, load: (i){
                        load();
                      }, onTap: (i) => _creators.value[i].navigate(context),);
                      // return CreatorGrid(creatorListProvider: value);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
