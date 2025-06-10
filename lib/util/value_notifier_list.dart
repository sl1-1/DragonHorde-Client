import 'package:flutter/material.dart';

class ValueNotifierList<T> extends ValueNotifier<List<T>> {
  ValueNotifierList(super.value);

  void add(T valueToAdd) {
    value.add(valueToAdd);
    notifyListeners();
  }

  void addAll(List<T> valueToAdd) {
    value.addAll(valueToAdd);
    notifyListeners();
  }

  void remove(T valueToRemove) {
    value.remove(valueToRemove);
    notifyListeners();
  }
  T removeAt(int pos) {
    T ret = value.removeAt(pos);
    notifyListeners();
    return ret;
  }

  void insert(int index, T element){
    value.insert(index, element);
  }

  bool get isNotEmpty{
    return value.isNotEmpty;
  }

  void clear(){
    value.clear();
  }

}