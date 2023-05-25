// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:io';

import 'package:exeo/controller/login_controller.dart';
import 'package:exeo/models/user_model.dart';
import 'package:exeo/services/constant.dart';
import 'package:exeo/services/design_patterns.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

enum ModePassword { HIDE, SHOW }

final showHidePawdProviderState =
    StateProvider<ModePassword>((ref) => ModePassword.HIDE);

final showHidePwdProvider = Provider<ModePassword>((ref) {
  final sortType = ref.watch(showHidePawdProviderState);

  switch (sortType) {
    case ModePassword.HIDE:
      return ModePassword.HIDE;

    case ModePassword.SHOW:
      return ModePassword.SHOW;
  }
});
// repasser a user apres
final registerUser =
    FutureProvider.family<bool, String>((ref, infoRegister) async {
  final apiUrl = Uri.parse("${urlApi}register");
  final response = await http.post(apiUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: infoRegister);
  if (response.statusCode == 200) {
    final Map<String, dynamic> json = jsonDecode(response.body);
    print(json);
    var res = json['data'];

    // final User infoContactSociete = User.fromMap(res);
    return true;
  } else {
    return false;
  }
});

final loginUser = FutureProvider.family<bool, Map<String, dynamic>>(
    (ref, infoRegister) async {
  SharedPreferences prefs = await SingletonSharedPreferences.getInstance();
  final apiUrl = Uri.parse("${urlApi}connection");
  final response = await http.post(apiUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: jsonEncode(infoRegister));
  final json = jsonDecode(response.body);
  if (json['status'] == 201) {
    return false;
  }
  if (response.statusCode == 200) {
    var res = json["data"][0];
    print(res);
    if (res != null) {
      final User infoContactSociete = User.fromMap(res);
      prefs.setString("email", infoRegister["email"]);
      prefs.setString("password", infoRegister["password"]);
      return true;
    } else {
      return false;
    }
  } else {
    throw Exception('failed to login');
  }
});

Future<bool> connection(Map<String, dynamic> infoUser) async {
  SharedPreferences prefs = await SingletonSharedPreferences.getInstance();
  final apiUrl = Uri.parse("${urlApi}connection");
  final response = await http.post(apiUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: jsonEncode(infoUser));
  final json = jsonDecode(response.body);
  if (json['status'] == 201) {
    return false;
  }
  if (response.statusCode == 200) {
    var res = json["data"][0];
    print(res);
    if (res != null) {
      final User infoContactSociete = User.fromMap(res);
      prefs.setString("email", infoUser["email"]);
      prefs.setString("password", infoUser["password"]);
      return true;
    } else {
      return false;
    }
  } else {
    throw Exception('failed to login');
  }
}
