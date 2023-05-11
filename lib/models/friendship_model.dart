import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Freindship {
  final DateTime date_relation_start;
  final int id_user;
  final int id_user_friend;

  Freindship({
    required this.date_relation_start,
    required this.id_user,
    required this.id_user_friend,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date_relation_start': date_relation_start.millisecondsSinceEpoch,
      'id_user': id_user,
      'id_user_friend': id_user_friend,
    };
  }

  factory Freindship.fromMap(Map<String, dynamic> map) {
    return Freindship(
      date_relation_start: DateTime.fromMillisecondsSinceEpoch(
          map['date_relation_start'] as int),
      id_user: map['id_user'] as int,
      id_user_friend: map['id_user_friend'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Freindship.fromJson(String source) =>
      Freindship.fromMap(json.decode(source) as Map<String, dynamic>);
}
