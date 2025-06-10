import 'package:dragonhorde_client_flutter/widgets/auto_complete_search.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class AddWidget extends StatefulWidget {
  /// Creates an instance of [AddWidget].
  const AddWidget({super.key, required this.icon, required this.text, this.onNew, this.onAdd, this.type});

  /// The child widget that will be listened to for gestures.
  final Icon icon;
  final String text;
  final Function(String)? onNew;
  final Function(String)? onAdd;
    final TagSearchType? type;



  @override
  State<AddWidget> createState() => _AddWidgetState();
}

class _AddWidgetState extends State<AddWidget> {
  final ValueNotifier<bool> _addMode = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _addMode,
      builder: (context, mode, child) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(toBeginningOfSentenceCase(widget.text), style: Theme.of(context).textTheme.titleMedium),
                mode
                    ? Container()
                    : IconButton(
                      icon: widget.icon,
                      onPressed: () {
                        _addMode.value = true;
                      },
                    ),
              ],
            ),
            mode
                ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Focus(
                        onFocusChange: (hasFocus) {
                          if (!hasFocus) {
                            _addMode.value = false;
                          }
                        },
                        child: TagSearchAutocomplete(
                          searchType: widget.type!=null?widget.type!:TagSearchType.All,
                          onSubmitted: (value) {
                            if(widget.onAdd != null){
                              widget.onAdd!(value.tag);
                            }
                            debugPrint(value.tag);
                          },
                          onNew: (value) async {
                            if(widget.onAdd != null){
                              return await widget.onNew!(value);
                            }
                            debugPrint(value);
                            return value;
                          },
                        ),
                      ),
                    ),
                  ],
                )
                : Container(),
          ],
        );
      },
    );
  }
}
