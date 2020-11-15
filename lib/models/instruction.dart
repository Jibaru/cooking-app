import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import './utils/model_list.dart';
import 'equipment.dart';
import 'ingredient.dart';
import 'step.dart';

class Instruction extends Equatable {
  final int id;
  final ModelList<Ingredient> ingredients;
  final ModelList<Equipment> equipments;
  final ModelList<Step> steps;

  const Instruction({
    @required this.id,
    @required this.ingredients,
    @required this.equipments,
    @required this.steps,
  });

  @override
  List<Object> get props => [id, ingredients, equipments, steps];

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ingredients': ingredients?.toListMap((e) => e.toMap()),
      'equipments': equipments?.toListMap((e) => e.toMap()),
      'steps': steps?.toListMap((e) => e.toMap()),
    };
  }

  factory Instruction.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Instruction(
      id: map['id'],
      ingredients: ModelList<Ingredient>.fromListMap(
        map['ingredients'],
        (e) => Ingredient.fromMap(e),
      ),
      equipments: ModelList<Equipment>.fromListMap(
        map['equipments'],
        (e) => Equipment.fromMap(e),
      ),
      steps: ModelList<Step>.fromListMap(
        map['steps'],
        (e) => Step.fromMap(e),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Instruction.fromJson(String source) =>
      Instruction.fromMap(json.decode(source));
}
