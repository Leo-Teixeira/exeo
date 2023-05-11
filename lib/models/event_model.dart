import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Event {
  final int id;
  final String start_date;
  final String end_date;
  final String title;
  final String subtitle;
  final String description;
  final int id_company;
  final int id_category;
  
  Event({
    required this.id,
    required this.start_date,
    required this.end_date,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.id_company,
    required this.id_category,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'start_date': start_date,
      'end_date': end_date,
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'id_company': id_company,
      'id_category': id_category,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['id'] as int,
      start_date: map['start_date'] as String,
      end_date: map['end_date'] as String,
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      description: map['description'] as String,
      id_company: map['id_company'] as int,
      id_category: map['id_category'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Event.fromJson(String source) => Event.fromMap(json.decode(source) as Map<String, dynamic>);
}
