import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Events {
  final int id;
  final String start_date;
  final String end_date;
  final String title;
  final String subtitle;
  final String description;
  final String Category;
  final String Company;

  Events({
    required this.id,
    required this.start_date,
    required this.end_date,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.Category,
    required this.Company,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'start_date': start_date,
      'end_date': end_date,
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'Category': Category,
      'Company': Company,
    };
  }

  factory Events.fromMap(Map<String, dynamic> map) {
    return Events(
      id: map['id'] as int,
      start_date: map['start_date'] as String,
      end_date: map['end_date'] as String,
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      description: map['description'] as String,
      Category: map['Category'] as String,
      Company: map['Company'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Events.fromJson(String source) =>
      Events.fromMap(json.decode(source) as Map<String, dynamic>);
}
