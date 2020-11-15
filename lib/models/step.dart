import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'image.dart';

class Step extends Equatable {
  final int id;
  final int orderNumber;
  final String content;
  final Image image;

  const Step({
    @required this.id,
    @required this.orderNumber,
    @required this.content,
    @required this.image,
  });

  @override
  List<Object> get props => [id, orderNumber, content, image];

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'orderNumber': orderNumber,
      'content': content,
      'image': image?.toMap(),
    };
  }

  factory Step.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Step(
      id: map['id'],
      orderNumber: map['orderNumber'],
      content: map['content'],
      image: Image.fromMap(map['stepImage']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Step.fromJson(String source) => Step.fromMap(json.decode(source));

  Step copyWith({
    int id,
    int orderNumber,
    String content,
    Image image,
  }) {
    return Step(
      id: id ?? this.id,
      orderNumber: orderNumber ?? this.orderNumber,
      content: content ?? this.content,
      image: image ?? this.image,
    );
  }
}
