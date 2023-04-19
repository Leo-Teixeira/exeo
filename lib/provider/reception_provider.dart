import 'package:flutter_riverpod/flutter_riverpod.dart';

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
