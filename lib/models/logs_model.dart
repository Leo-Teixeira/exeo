import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class logs {
  final int id;
  final String content;
  final String log_date;

  logs({
    required this.id,
    required this.content,
    required this.log_date,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'content': content,
      'log_date': log_date,
    };
  }

  factory logs.fromMap(Map<String, dynamic> map) {
    return logs(
      id: map['id'] as int,
      content: map['content'] as String,
      log_date: map['log_date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory logs.fromJson(String source) =>
      logs.fromMap(json.decode(source) as Map<String, dynamic>);
}
