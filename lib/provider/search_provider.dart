import 'package:flutter_riverpod/flutter_riverpod.dart';

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
