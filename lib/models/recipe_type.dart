import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class RecipeType extends Equatable {
  final int id;
  final String name;
  final String description;

  const RecipeType({
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

  factory RecipeType.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return RecipeType(
      id: map['id'],
      name: map['name'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RecipeType.fromJson(String source) =>
      RecipeType.fromMap(json.decode(source));
}
