import 'dart:convert';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class IngredientInsert extends Equatable {
  final String name;
  final String description;
  final File image;
  final List<int> nutrientsId;
  final List<int> ingredientCategoriesId;

  const IngredientInsert({
    @required this.name,
    @required this.description,
    @required this.image,
    @required this.nutrientsId,
    @required this.ingredientCategoriesId,
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
      'nutrientsId': nutrientsId,
      'ingredientCategoriesId': ingredientCategoriesId,
    };
  }

  String toJson() => json.encode(toMap());

  IngredientInsert copyWith({
    String name,
    String description,
    File image,
    List<int> nutrientsId,
    List<int> ingredientCategoriesId,
  }) {
    return IngredientInsert(
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      nutrientsId: nutrientsId ?? this.nutrientsId,
      ingredientCategoriesId:
          ingredientCategoriesId ?? this.ingredientCategoriesId,
    );
  }
}
