
import 'package:dio/dio.dart';
import 'package:dragonhorde_client_flutter/models/artists_metadata.dart';
import 'package:dragonhorde_client_flutter/util/value_notifier_list.dart';
import 'package:flutter/material.dart';

class CreateArtistDialog extends StatefulWidget {
  const CreateArtistDialog({super.key, required this.text});

  /// The child widget that will be listened to for gestures.
  final String text;
  // late final TextEditingController nameController;

  @override
  State<CreateArtistDialog> createState() => CreateArtistDialogState();
}

class CreateArtistDialogState extends State<CreateArtistDialog> {
  final _formKey = GlobalKey<FormState>();
  late final nameController = TextEditingController(text: widget.text);
  final descriptionController = TextEditingController();
  final ValueNotifierList<String> alias = ValueNotifierList([]);
  ValueNotifier<String?> errorMessage = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return SimpleDialog(
      title: const Text('Create Artist'),
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              ValueListenableBuilder(
                valueListenable: errorMessage,
                builder: (context, err, child) {
                  return err != null ? Text(err, style: TextStyle(color: Colors.red),) : Container();
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
              // ValueListenableBuilder(
              //   valueListenable: alias,

              //   builder: (context, mode, child) {
              //     return TagGroup(
              //       group: "Artists",
              //       tags: creators.value,
              //       type: TagSearchType.Artist,
              //       onAdd: (value) {
              //         debugPrint("add $value");
              //         creators.add(
              //           TagReturn(
              //             (b) =>
              //                 b
              //                   ..tag = value
              //                   ..tagType = TagReturnTagTypeEnum.artist,
              //           ),
              //         );
              //       },
              //       onNew: (value) async {
              //         var ret = value;
              //         debugPrint("new $ret");
              //         return ret;
              //       },
              //       onDelete: (value) => {creators.remove(value)},
              //     );
              //   },
              // ),

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

                // Response<ApiCollection> results = await apiClient.getCreatorsApi().(
                //   apiCollection: ApiCollection(
                //     (b) =>
                //         b
                //           ..name = nameController.text
                //           ..description = descriptionController.text
                //           ..creators = ListBuilder(
                //             creators.value.map((t) {
                //               return t.tag;
                //             }),
                //           ),
                //   ),
                // );
                Navigator.pop(context, ArtistMetadata(nameController.text));
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
