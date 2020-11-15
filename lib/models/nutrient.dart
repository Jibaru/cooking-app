import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'amount.dart';

class Nutrient extends Equatable {
  final int id;
  final String name;
  final Amount amount;

  const Nutrient({
    @required this.id,
    @required this.name,
    @required this.amount,
  });

  @override
  List<Object> get props => [id, name, amount];

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'amount': amount?.toMap(),
    };
  }

  factory Nutrient.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Nutrient(
      id: map['id'],
      name: map['name'],
      amount: Amount.fromMap(map['amount']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Nutrient.fromJson(String source) =>
      Nutrient.fromMap(json.decode(source));

  Nutrient copyWith({
    int id,
    String name,
    Amount amount,
  }) {
    return Nutrient(
      id: id ?? this.id,
      name: name ?? this.name,
      amount: amount ?? this.amount,
    );
  }
}
