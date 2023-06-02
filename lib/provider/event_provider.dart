import 'dart:convert';

import 'package:exeo/models/event_model.dart';
import 'package:exeo/services/constant.dart';
import 'package:exeo/services/design_patterns.dart';
import 'package:flutter/material.dart';
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
    FutureProvider.family<List<AllEvents>, String>((ref, value) async {
  final List<AllEvents> infoEventList = [];
  final apiUrl = Uri.parse("${urlApi}event/byTitle/$value");
  final response = await http.get(apiUrl, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  });
  final json = jsonDecode(response.body);
  if (json['status'] == 201) {
    return [];
  }
  if (response.statusCode == 200) {
    var res = json["data"];
    if (res != null) {
      for (int i = 0; i < res.length; i++) {
        ref.watch(getEventPicture(res[i]['id'])).whenData((value) {
          print(value);
          if (value.isNotEmpty) {
            infoEventList.add(
                AllEvents.fromMap(res[i], value[0].content, value[1].content));
          } else {
            infoEventList.add(AllEvents.fromMap(res[i], "", ""));
          }
        });
      }
      return infoEventList;
    } else {
      return [];
    }
  } else {
    throw Exception('failed to login');
  }
});

final getEventCategoryProvider =
    FutureProvider.family<List<Events>, String>((ref, value) async {
  final List<Events> infoEventsList = [];
  final apiUrl = Uri.parse("${urlApi}event/category/$value");
  final response = await http.get(apiUrl, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  });
  final json = jsonDecode(response.body);
  if (json['status'] == 201) {
    return [];
  }
  if (response.statusCode == 200) {
    var res = json["data"];
    if (res != null) {
      for (int i = 0; i < res.length; i++) {
        ref.watch(getEventPicture(res[i]['id'])).whenData((value) {
          if (value.isNotEmpty) {
            infoEventsList.add(
                Events.fromMap(res[i], value[0].content, value[1].content));
          } else {
            infoEventsList.add(Events.fromMap(res[i], "", ""));
          }
        });
      }
      return infoEventsList;
    } else {
      return [];
    }
  } else {
    throw Exception('failed to login');
  }
});

final getEventPicture =
    FutureProvider.family<List<Picture>, int>((ref, id) async {
  print(id);
  final List<Picture> pictureEvent = [];
  final apiUrl = Uri.parse("${urlApi}event/image/$id");
  final response = await http.get(apiUrl, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  });
  final json = jsonDecode(response.body);
  if (json['status'] == 201) {
    return [];
  }
  if (response.statusCode == 200) {
    var res = json["data"];
    print(res);
    if (res != null) {
      for (int i = 0; i < res.length; i++) {
        pictureEvent.add(Picture.fromMap(res[i]));
      }
      return pictureEvent;
    } else {
      return [];
    }
  } else {
    throw Exception('failed to login');
  }
});

final searchControllerProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());

final searchEventProvider =
    StateNotifierProvider((ref) => SearchContactNotifier(''));

class SearchContactNotifier extends StateNotifier<String> {
  SearchContactNotifier(String initialState) : super(initialState);

  //* Cette fonction définit la variable d'état sur une version minuscule de la chaîne d'entrée.
  //*
  //* Args:
  //*   searchContact (String): Une chaîne représentant le contact que l'utilisateur recherche. La
  //* méthode convertit la chaîne en minuscules et l'affecte à la variable "state".
  void filterSearchEvent(String searchEvent) {
    state = searchEvent.toLowerCase();
  }
}

enum TypeListReception { EVENEMENT, ACTIVITE }

final typeListReceptionProviderState =
    StateProvider<TypeListReception>((ref) => TypeListReception.EVENEMENT);

final typeListReceptionProvider = Provider<TypeListReception>((ref) {
  final sortType = ref.watch(typeListReceptionProviderState);

  switch (sortType) {
    case TypeListReception.EVENEMENT:
      return TypeListReception.EVENEMENT;

    case TypeListReception.ACTIVITE:
      return TypeListReception.ACTIVITE;
  }
});
