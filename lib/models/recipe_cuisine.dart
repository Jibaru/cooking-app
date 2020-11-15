import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class RecipeCuisine extends Equatable {
  final int id;
  final String name;
  final String region;

  const RecipeCuisine({
    @required this.id,
    @required this.name,
    this.region,
  });

  @override
  List<Object> get props => [id, name, region];

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'region': region,
    };
  }

  factory RecipeCuisine.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return RecipeCuisine(
      id: map['id'],
      name: map['name'],
      region: map['region'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RecipeCuisine.fromJson(String source) =>
      RecipeCuisine.fromMap(json.decode(source));
}
