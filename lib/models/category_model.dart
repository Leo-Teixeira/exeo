import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Category {
  final int id;
  final String name;
  final int access_vip;

  Category({
    required this.id,
    required this.name,
    required this.access_vip,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'access_vip': access_vip,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as int,
      name: map['name'] as String,
      access_vip: map['access_vip'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);
}
