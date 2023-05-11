import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Photo {
  final int id;
  final String content;
  final int id_company;
  final int id_event;
  final String type_photo;

  Photo({
    required this.id,
    required this.content,
    required this.id_company,
    required this.id_event,
    required this.type_photo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'content': content,
      'id_company': id_company,
      'id_event': id_event,
      'type_photo': type_photo,
    };
  }

  factory Photo.fromMap(Map<String, dynamic> map) {
    return Photo(
      id: map['id'] as int,
      content: map['content'] as String,
      id_company: map['id_company'] as int,
      id_event: map['id_event'] as int,
      type_photo: map['type_photo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Photo.fromJson(String source) =>
      Photo.fromMap(json.decode(source) as Map<String, dynamic>);
}
