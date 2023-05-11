// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';

class Company {
  final int id;
  final String name;
  final String email;
  final String password;
  //! changer point par lng and lat
  final Float lng;
  final Float lat;
  final int siret;
  final String logo;
  final String description;
  final String site_internet;

  Company({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.lng,
    required this.lat,
    required this.siret,
    required this.logo,
    required this.description,
    required this.site_internet,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'lng': lng,
      'lat': lat,
      'siret': siret,
      'logo': logo,
      'description': description,
      'site_internet': site_internet,
    };
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      lng: map['lng'],
      lat: map['lat'],
      siret: map['siret'] as int,
      logo: map['logo'] as String,
      description: map['description'] as String,
      site_internet: map['site_internet'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Company.fromJson(String source) =>
      Company.fromMap(json.decode(source) as Map<String, dynamic>);
}
