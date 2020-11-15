import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'image.dart';

class Equipment extends Equatable {
  final int id;
  final String name;
  final String description;
  final Image image;

  const Equipment({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.image,
  });

  @override
  List<Object> get props => [id, name, description, image];

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image?.toMap(),
    };
  }

  factory Equipment.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Equipment(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      image: Image.fromMap(map['image']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Equipment.fromJson(String source) =>
      Equipment.fromMap(json.decode(source));

  Equipment copyWith({
    int id,
    String name,
    String description,
    Image image,
  }) {
    return Equipment(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }
}
