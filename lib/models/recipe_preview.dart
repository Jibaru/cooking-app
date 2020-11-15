import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'image.dart';
import 'user.dart';

class RecipePreview extends Equatable {
  final int id;
  final String title;
  final DateTime dateTimePublished;
  final String description;
  final Duration prepTime;
  final Duration cookTime;
  final Image image;
  final User createdBy;

  const RecipePreview({
    @required this.id,
    @required this.title,
    @required this.dateTimePublished,
    @required this.description,
    @required this.prepTime,
    @required this.cookTime,
    @required this.image,
    @required this.createdBy,
  });

  @override
  List<Object> get props => [
        id,
        title,
        dateTimePublished,
        description,
        prepTime,
        cookTime,
        image,
        createdBy,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'dateTimePublished': dateTimePublished?.millisecondsSinceEpoch,
      'description': description,
      'prepTime': prepTime?.inMilliseconds,
      'cookTime': cookTime?.inMilliseconds,
      'image': image?.toMap(),
      'createdBy': createdBy?.toMap(),
    };
  }

  factory RecipePreview.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return RecipePreview(
      id: map['id'],
      title: map['title'],
      dateTimePublished: DateTime.parse(map['dateTimePublished']),
      description: map['description'],
      prepTime: map['prepTime'] != null
          ? Duration(milliseconds: map['prepTime'])
          : null,
      cookTime: map['cookTime'] != null
          ? Duration(milliseconds: map['cookTime'])
          : null,
      image: Image.fromMap(map['image']),
      createdBy: User.fromMap(map['createdBy']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RecipePreview.fromJson(String source) =>
      RecipePreview.fromMap(json.decode(source));

  RecipePreview copyWith({
    int id,
    String title,
    DateTime dateTimePublished,
    String description,
    Duration prepTime,
    Duration cookTime,
    Image image,
    User createdBy,
  }) {
    return RecipePreview(
      id: id ?? this.id,
      title: title ?? this.title,
      dateTimePublished: dateTimePublished ?? this.dateTimePublished,
      description: description ?? this.description,
      prepTime: prepTime ?? this.prepTime,
      cookTime: cookTime ?? this.cookTime,
      image: image ?? this.image,
      createdBy: createdBy ?? this.createdBy,
    );
  }
}
