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
  final String logo;
  final String picture;

  Events({
    required this.id,
    required this.start_date,
    required this.end_date,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.Category,
    required this.Company,
    required this.logo,
    required this.picture,
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
      'logo': logo,
      'picture': picture,
    };
  }

  factory Events.fromMap(
      Map<String, dynamic> map, String logo, String picture) {
    return Events(
      id: map['id'] as int,
      start_date: map['start_date'] as String,
      end_date: map['end_date'] as String,
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      description: map['description'] as String,
      Category: map['Category'] as String,
      Company: map['Company'] as String,
      logo: logo,
      picture: picture,
    );
  }
}

class AllEvents {
  final int id;
  final String start_date;
  final String end_date;
  final String title;
  final String subtitle;
  final String description;
  final int id_category;
  final int id_company;
  final String logo;
  final String picture;

  AllEvents({
    required this.id,
    required this.start_date,
    required this.end_date,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.id_category,
    required this.id_company,
    required this.logo,
    required this.picture,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'start_date': start_date,
      'end_date': end_date,
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'id_category': id_category,
      'id_company': id_company,
      'logo': logo,
      'picture': picture,
    };
  }

  factory AllEvents.fromMap(
      Map<String, dynamic> map, String logo, String picture) {
    return AllEvents(
      id: map['id'] as int,
      start_date: map['start_date'] as String,
      end_date: map['end_date'] as String,
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      description: map['description'] as String,
      id_category: map['id_category'] as int,
      id_company: map['id_company'] as int,
      logo: logo,
      picture: picture,
    );
  }

  String toJson() => json.encode(toMap());
}

class Picture {
  final int id;
  final String content;
  Picture({
    required this.id,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'content': content,
    };
  }

  factory Picture.fromMap(Map<String, dynamic> map) {
    return Picture(
      id: map['id'] as int,
      content: map['content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Picture.fromJson(String source) =>
      Picture.fromMap(json.decode(source) as Map<String, dynamic>);
}
