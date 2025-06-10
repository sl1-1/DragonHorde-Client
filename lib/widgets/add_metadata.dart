import 'package:dragonhorde_client_flutter/models/metadata_model.dart';
import 'package:dragonhorde_client_flutter/widgets/metadata_search_autocomplete.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddMetadata extends StatefulWidget {
  /// Creates an instance of [AddMetadata].
  const AddMetadata({super.key, required this.metadataContainer});

  /// The child widget that will be listened to for gestures.
  final MetadataContainer metadataContainer;
  // final TagSearchType? type;

  @override
  State<AddMetadata> createState() => _AddMetadataState();
}

class _AddMetadataState extends State<AddMetadata> {
  final ValueNotifier<bool> _inAddMode = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _inAddMode,
      builder: (context, mode, child) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  toBeginningOfSentenceCase(widget.metadataContainer.name),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                !mode && widget.metadataContainer.canAdd
                    ? IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        _inAddMode.value = true;
                      },
                    )
                    : Container(),
              ],
            ),
            mode
                ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Focus(
                        onFocusChange: (hasFocus) {
                          // if (!hasFocus) {
                          //   _inAddMode.value = false;
                          // }
                        },
                        child: MetadataSearchAutocomplete(metadataContainer: widget.metadataContainer,
                        ),
                      ),
                    ),
                  ],
                )
                :
            Container(),
          ],
        );
      },
    );
  }
}
