import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class GridItemModel {
  String get title;
  Widget get thumbnail;
  Widget get onHover;
  void navigate(context);
}