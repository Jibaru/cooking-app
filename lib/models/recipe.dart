import 'dart:convert';

import 'package:cooking_app/models/recipe_preview.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import './utils/model_list.dart';
import 'instruction.dart';
import 'recipe_cuisine.dart';
import 'recipe_tag.dart';
import 'recipe_type.dart';

class Recipe extends Equatable {
  final RecipePreview recipePreview;
  final int yieldPersons;
  final Instruction instruction;
  final RecipeCuisine recipeCuisine;
  final RecipeType recipeType;
  final ModelList<RecipeTag> recipeTags;

  const Recipe({
    @required this.recipePreview,
    @required this.yieldPersons,
    @required this.instruction,
    @required this.recipeCuisine,
    @required this.recipeType,
    @required this.recipeTags,
  });

  @override
  List<Object> get props => [
        recipePreview,
        instruction,
        recipeCuisine,
        recipeType,
        recipeTags,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return {
      'recipePreview': recipePreview?.toMap(),
      'yield': yieldPersons,
      'instruction': instruction?.toMap(),
      'recipeCuisine': recipeCuisine?.toMap(),
      'recipeType': recipeType?.toMap(),
      'recipeTags': recipeTags?.toListMap((e) => e.toMap()),
    };
  }

  factory Recipe.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Recipe(
      recipePreview: RecipePreview.fromMap(map),
      yieldPersons: map['yield'],
      instruction: Instruction.fromMap(map['instruction']),
      recipeCuisine: RecipeCuisine.fromMap(map['recipeCuisine']),
      recipeType: RecipeType.fromMap(map['recipeType']),
      recipeTags:
          ModelList.fromListMap(map['recipeTags'], (e) => RecipeTag.fromMap(e)),
    );
  }

  String toJson() => json.encode(toMap());

  factory Recipe.fromJson(String source) => Recipe.fromMap(json.decode(source));

  Recipe copyWith({
    RecipePreview recipePreview,
    int yieldPersons,
    Duration prepTime,
    Duration cookTime,
    Instruction instruction,
    RecipeCuisine recipeCuisine,
    RecipeType recipeType,
    ModelList<RecipeTag> recipeTags,
  }) {
    return Recipe(
      recipePreview: recipePreview ?? this.recipePreview,
      yieldPersons: yieldPersons ?? this.yieldPersons,
      instruction: instruction ?? this.instruction,
      recipeCuisine: recipeCuisine ?? this.recipeCuisine,
      recipeType: recipeType ?? this.recipeType,
      recipeTags: recipeTags ?? this.recipeTags,
    );
  }
}
