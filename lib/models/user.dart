import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'image.dart';

class User extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String nickName;
  final String email;
  final Image image;

  const User({
    this.id,
    this.firstName,
    this.lastName,
    this.nickName,
    this.email,
    this.image,
  });

  @override
  List<Object> get props => [id, firstName, lastName, nickName, image];

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'nickName': nickName,
      'email': email,
      'image': image,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      nickName: map['nickName'],
      email: map['email'],
      image: Image.fromMap(map['profileImage']),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
