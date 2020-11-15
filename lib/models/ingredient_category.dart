import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class IngredientCategory extends Equatable {
  final int id;
  final String name;
  final String description;

  const IngredientCategory({
    @required this.id,
    @required this.name,
    @required this.description,
  });

  @override
  List<Object> get props => [id, name, description];

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory IngredientCategory.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return IngredientCategory(
      id: map['id'],
      name: map['name'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory IngredientCategory.fromJson(String source) =>
      IngredientCategory.fromMap(json.decode(source));

  IngredientCategory copyWith({
    int id,
    String name,
    String description,
  }) {
    return IngredientCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}
