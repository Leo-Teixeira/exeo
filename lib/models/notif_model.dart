import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Notif {
  final int id;
  final String name;
  final String content;
  final String type_notif;
  final int id_user_notif;

  Notif({
    required this.id,
    required this.name,
    required this.content,
    required this.type_notif,
    required this.id_user_notif,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'content': content,
      'type_notif': type_notif,
      'id_user_notif': id_user_notif,
    };
  }

  factory Notif.fromMap(Map<String, dynamic> map) {
    return Notif(
      id: map['id'] as int,
      name: map['name'] as String,
      content: map['content'] as String,
      type_notif: map['type_notif'] as String,
      id_user_notif: map['id_user_notif'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Notif.fromJson(String source) =>
      Notif.fromMap(json.decode(source) as Map<String, dynamic>);
}
