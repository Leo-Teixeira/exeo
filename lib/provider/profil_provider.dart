import 'dart:convert';

import 'package:exeo/services/constant.dart';
import 'package:exeo/services/design_patterns.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

enum ModifMyProfil { MODIF, UNMODIF }

final modifMyProfilProvider =
    StateProvider<ModifMyProfil>((ref) => ModifMyProfil.UNMODIF);

final myProfilModifProvider = Provider<ModifMyProfil>((ref) {
  final sortType = ref.watch(modifMyProfilProvider);

  switch (sortType) {
    case ModifMyProfil.MODIF:
      return ModifMyProfil.MODIF;

    case ModifMyProfil.UNMODIF:
      return ModifMyProfil.UNMODIF;
  }
});

enum EditMyPasswordProfil { EDIT, UNEDIT }

final editMyPasswordProfilProvider =
    StateProvider<EditMyPasswordProfil>((ref) => EditMyPasswordProfil.UNEDIT);

final myPasswordProfilProvider = Provider<EditMyPasswordProfil>((ref) {
  final sortType = ref.watch(editMyPasswordProfilProvider);

  switch (sortType) {
    case EditMyPasswordProfil.EDIT:
      return EditMyPasswordProfil.EDIT;

    case EditMyPasswordProfil.UNEDIT:
      return EditMyPasswordProfil.UNEDIT;
  }
});

enum TypeProfil { MYPROFIL, OTHERPROFIL }

final typeProfilStateProvider =
    StateProvider<TypeProfil>((ref) => TypeProfil.MYPROFIL);

final typeProfilProvider = Provider<TypeProfil>((ref) {
  final sortType = ref.watch(typeProfilStateProvider);

  switch (sortType) {
    case TypeProfil.MYPROFIL:
      return TypeProfil.MYPROFIL;

    case TypeProfil.OTHERPROFIL:
      return TypeProfil.OTHERPROFIL;
  }
});

enum TypeFollow { FOLLOW, UNFOLLOW }

final typeFollowStateProvider =
    StateProvider<TypeFollow>((ref) => TypeFollow.UNFOLLOW);

final typeFollowProvider = Provider<TypeFollow>((ref) {
  final sortType = ref.watch(typeFollowStateProvider);

  switch (sortType) {
    case TypeFollow.FOLLOW:
      return TypeFollow.FOLLOW;

    case TypeFollow.UNFOLLOW:
      return TypeFollow.UNFOLLOW;
  }
});

enum OptionFollower { OPTION, UNOPTION }

final optionFollowerStateProvider =
    StateProvider<OptionFollower>((ref) => OptionFollower.UNOPTION);

final optionFollowerProvider = Provider<OptionFollower>((ref) {
  final sortType = ref.watch(optionFollowerStateProvider);

  switch (sortType) {
    case OptionFollower.OPTION:
      return OptionFollower.OPTION;

    case OptionFollower.UNOPTION:
      return OptionFollower.UNOPTION;
  }
});

final listFriendshipUserProvider = FutureProvider<bool>((ref) async {
  SharedPreferences prefs = await SingletonSharedPreferences.getInstance();
  final apiUrl =
      Uri.parse("${urlApi}friendship/${prefs.getInt('idUser').toString()}");
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

final addFriendshipUserProvider =
    FutureProvider.family<bool, int>((ref, friendId) async {
  SharedPreferences prefs = await SingletonSharedPreferences.getInstance();
  final apiUrl = Uri.parse(
      "${urlApi}addFriend/${prefs.getInt('idUser').toString()}/$friendId");
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

final editInfoUserProvider =
    FutureProvider.family<bool, Map<String, dynamic>>((ref, infoUser) async {
  SharedPreferences prefs = await SingletonSharedPreferences.getInstance();
  final apiUrl = Uri.parse("${urlApi}editUser");
  final response = await http.post(apiUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: jsonEncode(infoUser));
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

final editMdpUserProvider =
    FutureProvider.family<bool, Map<String, dynamic>>((ref, infoUser) async {
  SharedPreferences prefs = await SingletonSharedPreferences.getInstance();
  final apiUrl = Uri.parse("${urlApi}editUserPassword");
  final response = await http.post(apiUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: jsonEncode(infoUser));
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
