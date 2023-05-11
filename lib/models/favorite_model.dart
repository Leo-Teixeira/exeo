import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Favorite {
  final int id;
  final int id_user_fav;
  final int id_event;
  final String type_fav;

  Favorite({
    required this.id,
    required this.id_user_fav,
    required this.id_event,
    required this.type_fav,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'id_user_fav': id_user_fav,
      'id_event': id_event,
      'type_fav': type_fav,
    };
  }

  factory Favorite.fromMap(Map<String, dynamic> map) {
    return Favorite(
      id: map['id'] as int,
      id_user_fav: map['id_user_fav'] as int,
      id_event: map['id_event'] as int,
      type_fav: map['type_fav'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Favorite.fromJson(String source) =>
      Favorite.fromMap(json.decode(source) as Map<String, dynamic>);
}
