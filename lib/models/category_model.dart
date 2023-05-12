import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Category {
  final int id;
  final String name;
  final String? description;
  final String? content;

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'content': content,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] != null ? map['description'] as String : null,
      content: map['content'] != null ? map['content'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);
}
