import 'dart:convert';

import 'package:exeo/models/category_model.dart';
import 'package:exeo/models/event_model.dart';
import 'package:exeo/services/constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

enum AddFavoris { FAVORIS, UNFAVORIS }

final addFavorisStateProvider =
    StateProvider<AddFavoris>((ref) => AddFavoris.UNFAVORIS);

final addFavorisProvider = Provider<AddFavoris>((ref) {
  final sortType = ref.watch(addFavorisStateProvider);

  switch (sortType) {
    case AddFavoris.FAVORIS:
      return AddFavoris.FAVORIS;

    case AddFavoris.UNFAVORIS:
      return AddFavoris.UNFAVORIS;
  }
});

enum TypeInfo { EVENEMENT, LIEU }

final typeInfoStateProvider =
    StateProvider<TypeInfo>((ref) => TypeInfo.EVENEMENT);

final typeInfoProvider = Provider<TypeInfo>((ref) {
  final sortType = ref.watch(typeInfoStateProvider);

  switch (sortType) {
    case TypeInfo.EVENEMENT:
      return TypeInfo.EVENEMENT;

    case TypeInfo.LIEU:
      return TypeInfo.LIEU;
  }
});

final getEvenementsLimit =
    FutureProvider.family<List<Events>, int>((ref, limit) async {
  final List<Events> infoEventList = [];
  final apiUrl = Uri.parse("${urlApi}event/limit/$limit");
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
        infoEventList.add(Events.fromMap(res[i]));
      }
      return infoEventList;
    } else {
      return [];
    }
  } else {
    throw Exception('failed to login');
  }
});

final getAllEvent = FutureProvider<List<AllEvents>>((ref) async {
  final List<AllEvents> infoEventList = [];
  final apiUrl = Uri.parse("${urlApi}event");
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
        infoEventList.add(AllEvents.fromMap(res[i]));
      }
      return infoEventList;
    } else {
      return [];
    }
  } else {
    throw Exception('failed to login');
  }
});

final getActivite = FutureProvider<List<Category>>((ref) async {
  final List<Category> infoCategoryList = [];
  final apiUrl = Uri.parse("${urlApi}category");
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
        infoCategoryList.add(Category.fromMap(res[i]));
      }
      print(infoCategoryList);
      return infoCategoryList;
    } else {
      return [];
    }
  } else {
    throw Exception('failed to login');
  }
});
