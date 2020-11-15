import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import './utils/model_list.dart';
import 'image.dart';
import 'ingredient_category.dart';
import 'nutrient.dart';

class Ingredient extends Equatable {
  final int id;
  final String name;
  final String description;
  final Image image;
  final ModelList<Nutrient> nutrients;
  final ModelList<IngredientCategory> ingredientCategories;

  const Ingredient({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.image,
    @required this.nutrients,
    @required this.ingredientCategories,
  });

  @override
  List<Object> get props => [
        id,
        name,
        description,
        image,
        nutrients,
        ingredientCategories,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image?.toMap(),
      'nutrients': nutrients?.toListMap((e) => e.toMap()),
      'ingredientCategories': ingredientCategories?.toListMap((e) => e.toMap()),
    };
  }

  factory Ingredient.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Ingredient(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      image: Image.fromMap(map['image']),
      nutrients: ModelList<Nutrient>.fromListMap(
        map['nutrients'],
        (e) => Nutrient.fromMap(e),
      ),
      ingredientCategories: ModelList<IngredientCategory>.fromListMap(
        map['ingredientCategories'],
        (e) => IngredientCategory.fromMap(e),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Ingredient.fromJson(String source) =>
      Ingredient.fromMap(json.decode(source));

  Ingredient copyWith({
    int id,
    String name,
    String description,
    Image image,
    ModelList<Nutrient> nutrients,
    ModelList<IngredientCategory> ingredientCategories,
  }) {
    return Ingredient(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      nutrients: nutrients ?? this.nutrients,
      ingredientCategories: ingredientCategories ?? this.ingredientCategories,
    );
  }
}
