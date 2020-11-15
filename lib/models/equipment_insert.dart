import 'dart:convert';
import 'dart:io';

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class EquipmentInsert extends Equatable {
  final String name;
  final String description;
  final File image;

  const EquipmentInsert({
    @required this.name,
    @required this.description,
    @required this.image,
  });

  @override
  List<Object> get props => [name, description, image];

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'image': image,
    };
  }

  String toJson() => json.encode(toMap());

  EquipmentInsert copyWith({
    String name,
    String description,
    File image,
  }) {
    return EquipmentInsert(
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }
}
