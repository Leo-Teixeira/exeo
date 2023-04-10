import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ThemeModeApp { DARKMODE, LIGHTMODE }

final themeModeProviderState =
    StateProvider<ThemeModeApp>((_) => ThemeModeApp.LIGHTMODE);

final themeModeProvider = Provider<ThemeModeApp>((ref) {
  final ThemeModeApp sortType = ref.watch(themeModeProviderState);

  switch (sortType) {
    case ThemeModeApp.LIGHTMODE:
      return ThemeModeApp.LIGHTMODE;

    case ThemeModeApp.DARKMODE:
      return ThemeModeApp.DARKMODE;
  }
});
