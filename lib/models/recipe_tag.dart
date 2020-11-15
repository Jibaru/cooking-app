import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class RecipeTag extends Equatable {
  final int id;
  final String name;

  const RecipeTag({
    @required this.id,
    @required this.name,
  });

  @override
  List<Object> get props => [id, name];

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory RecipeTag.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return RecipeTag(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RecipeTag.fromJson(String source) =>
      RecipeTag.fromMap(json.decode(source));

  RecipeTag copyWith({
    int id,
    String name,
  }) {
    return RecipeTag(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
