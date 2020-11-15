import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class Amount extends Equatable {
  final double value;
  final String units;

  const Amount({
    @required this.value,
    @required this.units,
  });

  @override
  List<Object> get props => [value, units];

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'units': units,
    };
  }

  factory Amount.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Amount(
      value: map['value'],
      units: map['units'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Amount.fromJson(String source) => Amount.fromMap(json.decode(source));

  Amount copyWith({
    double value,
    String units,
  }) {
    return Amount(
      value: value ?? this.value,
      units: units ?? this.units,
    );
  }
}
