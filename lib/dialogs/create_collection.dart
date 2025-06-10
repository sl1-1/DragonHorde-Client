import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:dragonhorde_client_flutter/api_provider.dart';
import 'package:dragonhorde_client_flutter/models/collections_metadata.dart';
import 'package:dragonhorde_client_flutter/util/value_notifier_list.dart';
import 'package:dragonhorde_client_flutter/widgets/auto_complete_search.dart';
import 'package:dragonhorde_client_flutter/widgets/tag_group.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

class CreateCollectionDialog extends StatefulWidget {
  const CreateCollectionDialog({super.key, required this.text});

  /// The child widget that will be listened to for gestures.
  final String text;
  // late final TextEditingController nameController;

  @override
  State<CreateCollectionDialog> createState() => CreateCollectionDialogState();
}

class CreateCollectionDialogState extends State<CreateCollectionDialog> {
  final _formKey = GlobalKey<FormState>();
  late final nameController = TextEditingController(text: widget.text);
  final descriptionController = TextEditingController();
  final ValueNotifierList<TagReturn> creators = ValueNotifierList([]);
  final ValueNotifierList<TagReturn> tags = ValueNotifierList([]);
  ValueNotifier<String?> errorMessage = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return SimpleDialog(
      title: const Text('Create Collection'),
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              ValueListenableBuilder(
                valueListenable: errorMessage,
                builder: (context, err, child) {
                  return err != null ? Text(err, style: TextStyle(color: Colors.red)) : Container();
                },
              ),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(icon: Icon(Icons.folder), labelText: 'Name *'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  }
                  if (value.contains(RegExp(r'[-:]', caseSensitive: false))) {
                    return 'Name can not contain "-", ":"';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(icon: Icon(Icons.description), labelText: 'Description'),
                controller: descriptionController,
              ),
              ValueListenableBuilder(
                valueListenable: creators,

                builder: (context, mode, child) {
                  return TagGroup(
                    group: "Artists",
                    tags: creators.value,
                    type: TagSearchType.Artist,
                    onAdd: (value) {
                      debugPrint("add $value");
                      creators.add(
                        TagReturn(
                          (b) =>
                              b
                                ..tag = value
                                ..tagType = TagReturnTagTypeEnum.artist,
                        ),
                      );
                    },
                    onNew: (value) async {
                      var ret = value;
                      debugPrint("new $ret");
                      return ret;
                    },
                    onDelete: (value) => {creators.remove(value)},
                  );
                },
              ),
              // ValueListenableBuilder(
              //   valueListenable: tags,

              //   builder: (context, mode, child) {
              //     return TagGroup(
              //       group: "Tags",
              //       tags: tags.value,
              //       type: TagSearchType.Tag,
              //       onAdd: (value) {
              //         debugPrint("add $value");
              //         tags.add(
              //           TagReturn(
              //             (b) =>
              //                 b
              //                   ..tag = value
              //                   ..tagType = TagReturnTagTypeEnum.tag,
              //           ),
              //         );
              //       },
              //       onNew: (value) async {
              //         var ret = value;
              //         debugPrint("new $ret");
              //         return ret;
              //       },
              //       onDelete: (value) => {tags.remove(value)},
              //     );
              //   },
              // ),
              // Add TextFormFields and ElevatedButton here.
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            // Validate returns true if the form is valid, or false otherwise.
            if (_formKey.currentState!.validate()) {
              // If the form is valid, display a snackbar. In the real world,
              // you'd often call a server or save the information in a database.
              try {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Processing Data')));

                Response<ApiCollection> results = await apiClient.getCollectionApi().postCollection(
                  apiCollection: ApiCollection(
                    (b) =>
                        b
                          ..name = nameController.text
                          ..description = descriptionController.text
                          ..creators = ListBuilder(
                            creators.value.map((t) {
                              return t.tag;
                            }),
                          ),
                  ),
                );
                if (context.mounted) {
                  Navigator.pop(context, CollectionMetadata(results.data!.name!, results.data!.id!));
                }
              } on DioException catch (error) {
                if (error.response != null) {
                  if (error.response!.statusMessage != null) {
                    debugPrint("Local Error Handler");
                    errorMessage.value = error.response!.data!["error"].toString();
                  }
                }
              }
            }
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     children: [
  //       Row(children: [TextField(controller: nameController)]),
  //     ],
  //   );
  // }
}
