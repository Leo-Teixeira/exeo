import 'dart:convert';

import 'package:exeo/services/constant.dart';
import 'package:exeo/services/design_patterns.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final listUserFavProvider = FutureProvider<bool>((ref) async {
  SharedPreferences prefs = await SingletonSharedPreferences.getInstance();
  final apiUrl = Uri.parse(
      "${urlApi}favorite/userFAV/${prefs.getInt('idUser').toString()}");
  final response = await http.get(apiUrl, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  });
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

final listUserLikeProvider = FutureProvider<bool>((ref) async {
  SharedPreferences prefs = await SingletonSharedPreferences.getInstance();
  final apiUrl = Uri.parse(
      "${urlApi}favorite/userLIKE/${prefs.getInt('idUser').toString()}");
  final response = await http.get(apiUrl, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  });
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

final eventLikeProvider =
    FutureProvider.family<bool, int>((ref, eventId) async {
  SharedPreferences prefs = await SingletonSharedPreferences.getInstance();
  final apiUrl = Uri.parse(
      "${urlApi}addUserLIKE/${prefs.getInt('idUser').toString()}/$eventId");
  final response = await http.get(apiUrl, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  });
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

final eventFavProvider = FutureProvider.family<bool, int>((ref, eventId) async {
  SharedPreferences prefs = await SingletonSharedPreferences.getInstance();
  final apiUrl = Uri.parse(
      "${urlApi}addUserFAV/${prefs.getInt('idUser').toString()}/$eventId");
  final response = await http.get(apiUrl, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  });
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

final deleteEventLikeProvider =
    FutureProvider.family<bool, int>((ref, eventId) async {
  SharedPreferences prefs = await SingletonSharedPreferences.getInstance();
  final apiUrl = Uri.parse(
      "${urlApi}deleteUserLIKE/${prefs.getInt('idUser').toString()}/$eventId");
  final response = await http.get(apiUrl, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  });
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

final deleteEventFavProvider =
    FutureProvider.family<bool, int>((ref, eventId) async {
  SharedPreferences prefs = await SingletonSharedPreferences.getInstance();
  final apiUrl = Uri.parse(
      "${urlApi}deleteUserFAV/${prefs.getInt('idUser').toString()}/$eventId");
  final response = await http.get(apiUrl, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  });
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

final getEventByTitleProvider =
    FutureProvider.family<bool, String>((ref, value) async {
  final apiUrl = Uri.parse("${urlApi}event/byTitle/$value");
  final response = await http.get(apiUrl, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  });
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

final getEventCategoryProvider =
    FutureProvider.family<bool, String>((ref, value) async {
  final apiUrl = Uri.parse("${urlApi}event/category/$value");
  final response = await http.get(apiUrl, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  });
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
