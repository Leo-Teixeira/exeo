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
