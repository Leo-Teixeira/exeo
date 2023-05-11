// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

class User {
  final int id;
  final String email;
  final String password;
  final String firstname;
  final String lastname;
  final DateTime birth_date;
  final double lng;
  final double lat;
  // final int VIP;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.firstname,
    required this.lastname,
    required this.birth_date,
    required this.lng,
    required this.lat,
    // required this.VIP,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'password': password,
      'firstname': firstname,
      'lastname': lastname,
      'birth_date': birth_date.millisecondsSinceEpoch,
      'lng': lng,
      'lat': lat,
      // 'VIP': VIP,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      email: map['email'] as String,
      password: map['password'] as String,
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
      birth_date: DateTime.parse(map['birth_date']),
      lng: map['lng'].toDouble(),
      lat: map['lat'].toDouble(),
      // VIP: map['VIP'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
