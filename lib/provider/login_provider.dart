import 'package:flutter_riverpod/flutter_riverpod.dart';

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
