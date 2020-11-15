import 'dart:collection';
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ModelList<T extends Object> extends Equatable {
  final List<T> _items;

  const ModelList({
    List<T> items,
  }) : _items = items;

  T modelAt(int index) => _items[index];

  UnmodifiableListView<T> get items => UnmodifiableListView(_items);

  factory ModelList.fromList(List<T> items) {
    if (items == null) {
      return null;
    }
    return ModelList(items: items);
  }

  factory ModelList.fromListMap(List items, T Function(dynamic) mapper) {
    if (items == null) {
      return null;
    }
    return ModelList(items: items.map<T>(mapper).cast<T>().toList());
  }

  List<Map<String, dynamic>> toListMap(
      Map<String, dynamic> Function(dynamic) mapper) {
    return _items.map(mapper).toList();
  }

  String toJson() => json.encode(_items);

  factory ModelList.fromJson(String source) =>
      ModelList.fromList(json.decode(source));

  @override
  List<Object> get props => [_items];

  @override
  bool get stringify => true;
}
