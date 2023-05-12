import 'dart:convert';

import 'package:exeo/services/constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../models/event_model.dart';

enum ListSearch { LIST, SEARCH }

final listSearchProviderState =
    StateProvider<ListSearch>((_) => ListSearch.LIST);

final listModePorvider = Provider<ListSearch>((ref) {
  final ListSearch sortType = ref.watch(listSearchProviderState);

  switch (sortType) {
    case ListSearch.LIST:
      return ListSearch.LIST;

    case ListSearch.SEARCH:
      return ListSearch.SEARCH;
  }
});

final getAllEvents = FutureProvider(
  (ref) async {
    final List<Event> infoEventList = [];
    final apiUrl = Uri.parse("${urlApi}event/limit");
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
          infoEventList.add(Event.fromMap(res[i]));
        }
        return infoEventList;
      } else {
        return [];
      }
    } else {
      throw Exception('failed to login');
    }
  },
);
