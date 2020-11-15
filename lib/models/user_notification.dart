import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class UserNotification extends Equatable {
  final int id;
  final String subject;
  final String content;
  final DateTime dateTimeViewed;
  final DateTime dateTimeSended;

  const UserNotification({
    @required this.id,
    @required this.subject,
    @required this.content,
    @required this.dateTimeViewed,
    @required this.dateTimeSended,
  });

  @override
  List<Object> get props => [
        id,
        subject,
        content,
        dateTimeViewed,
        dateTimeSended,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'subject': subject,
      'content': content,
      'dateTimeViewed': dateTimeViewed?.millisecondsSinceEpoch,
      'dateTimeSended': dateTimeSended?.millisecondsSinceEpoch,
    };
  }

  factory UserNotification.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserNotification(
      id: map['id'],
      subject: map['subject'],
      content: map['content'],
      dateTimeViewed:
          DateTime.fromMillisecondsSinceEpoch(map['dateTimeViewed']),
      dateTimeSended:
          DateTime.fromMillisecondsSinceEpoch(map['dateTimeSended']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserNotification.fromJson(String source) =>
      UserNotification.fromMap(json.decode(source));

  UserNotification copyWith({
    int id,
    String subject,
    String content,
    DateTime dateTimeViewed,
    DateTime dateTimeSended,
  }) {
    return UserNotification(
      id: id ?? this.id,
      subject: subject ?? this.subject,
      content: content ?? this.content,
      dateTimeViewed: dateTimeViewed ?? this.dateTimeViewed,
      dateTimeSended: dateTimeSended ?? this.dateTimeSended,
    );
  }
}
