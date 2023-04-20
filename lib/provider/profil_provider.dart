import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    StateProvider<TypeProfil>((ref) => TypeProfil.OTHERPROFIL);

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
