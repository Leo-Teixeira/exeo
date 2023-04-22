import 'package:exeo/provider/profil_provider.dart';
import 'package:exeo/screens/more_user.dart';
import 'package:exeo/services/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/typicons_icons.dart';

class ProfilWidget extends ConsumerWidget {
  const ProfilWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ModifMyProfil modif = ref.watch(modifMyProfilProvider);
    EditMyPasswordProfil edit = ref.watch(editMyPasswordProfilProvider);
    TypeProfil profil = ref.watch(typeProfilStateProvider);
    TypeFollow follow = ref.watch(typeFollowStateProvider);
    OptionFollower option = ref.watch(optionFollowerStateProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: coulBlack,
        appBar: appBarReception(context),
        body: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("./assets/pictures/real_background.png"),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              profil == TypeProfil.OTHERPROFIL
                  ? titlePage(ref, context)
                  : Container(),
              const SizedBox(
                height: 20,
              ),
              profilUser(ref, context, modif, edit, profil, follow, option),
              modif == ModifMyProfil.MODIF || edit == EditMyPasswordProfil.EDIT
                  ? modifUser(context, modif)
                  : option == OptionFollower.OPTION
                      ? optionFollower(context, option, follow)
                      : Container(),
              tabBarEventSwipe(),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    listEvenementLike(follow, profil),
                    listSwipeLike(follow, profil),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget titlePage(WidgetRef ref, BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(left: 15, right: 15),
    child: Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              ref.refresh(typeProfilStateProvider);
              ref.refresh(typeFollowStateProvider);
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: coulWhite,
            ),
          ),
          const Center(
            child: Text(
              "Retour",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20, fontFamily: fontRubikMedium, color: coulWhite),
            ),
          ),
          //! centrer le texte
        ],
      ),
      Container(
        height: 1,
        color: coulWhite,
        child: const Divider(
          color: coulWhite,
          height: 0,
        ),
      ),
    ]),
  );
}

Widget tabBarEventSwipe() {
  return TabBar(
    tabs: [
      Tab(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.bookmark_add,
              color: coulGreyGrey,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Evenements",
              style: TextStyle(
                fontFamily: fontHindMaduraiMedium,
                fontSize: 16,
                color: coulGreyGrey,
              ),
            ),
          ],
        ),
      ),
      Tab(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Entypo.switch_icon,
              color: coulGreyGrey,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Swipe",
              style: TextStyle(
                fontFamily: fontHindMaduraiMedium,
                fontSize: 16,
                color: coulGreyGrey,
              ),
            ),
          ],
        ),
      )
    ],
  );
}

Widget optionFollower(
    BuildContext context, OptionFollower option, TypeFollow follow) {
  return Container(
    margin: const EdgeInsets.only(left: 15, right: 15),
    child: Column(
      children: [
        follow == TypeFollow.FOLLOW
            ? ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<OutlinedBorder?>(
                      RoundedRectangleBorder(
                          side: const BorderSide(
                            color: coulCiel,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8))),
                  backgroundColor: MaterialStateProperty.all<Color?>(coulCiel),
                  minimumSize: MaterialStateProperty.all<Size?>(
                    const Size(500.0, 40.0),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                    const EdgeInsets.fromLTRB(2.25, 11.25, 2.25, 11.25),
                  ),
                ),
                child: const Text(
                  "Ne plus suivre",
                  style: TextStyle(
                    color: coulBlack,
                    fontFamily: fontHindMaduraiMedium,
                    fontSize: 16,
                  ),
                ),
              )
            : Container(),
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder?>(
                RoundedRectangleBorder(
                    side: const BorderSide(
                      color: coulCiel,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8))),
            backgroundColor: MaterialStateProperty.all<Color?>(coulCiel),
            minimumSize: MaterialStateProperty.all<Size?>(
              const Size(500.0, 40.0),
            ),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
              const EdgeInsets.fromLTRB(2.25, 11.25, 2.25, 11.25),
            ),
          ),
          child: const Text(
            "Masquer l'utilisateur",
            style: TextStyle(
              color: coulBlack,
              fontFamily: fontHindMaduraiMedium,
              fontSize: 16,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder?>(
                RoundedRectangleBorder(
                    side: const BorderSide(
                      color: coulCiel,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8))),
            backgroundColor: MaterialStateProperty.all<Color?>(coulCiel),
            minimumSize: MaterialStateProperty.all<Size?>(
              const Size(500.0, 40.0),
            ),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
              const EdgeInsets.fromLTRB(2.25, 11.25, 2.25, 11.25),
            ),
          ),
          child: const Text(
            "Signaler l'utilisateur",
            style: TextStyle(
              color: coulBlack,
              fontFamily: fontHindMaduraiMedium,
              fontSize: 16,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder?>(
                RoundedRectangleBorder(
                    side: const BorderSide(
                      color: coulCiel,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8))),
            backgroundColor: MaterialStateProperty.all<Color?>(coulCiel),
            minimumSize: MaterialStateProperty.all<Size?>(
              const Size(500.0, 40.0),
            ),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
              const EdgeInsets.fromLTRB(2.25, 11.25, 2.25, 11.25),
            ),
          ),
          child: const Text(
            "Bloquer l'utilisateur",
            style: TextStyle(
              color: coulBlack,
              fontFamily: fontHindMaduraiMedium,
              fontSize: 16,
            ),
          ),
        )
      ],
    ),
  );
}

Widget modifUser(BuildContext context, ModifMyProfil modif) {
  late List<TextEditingController> textController = [];
  late List<FocusNode> focusController = [];
  for (int i = 0; i < 6; i++) {
    textController.add(TextEditingController());
    focusController.add(FocusNode());
  }
  return Form(
    child: Container(
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Column(
        children: [
          const SizedBox(height: 18),
          modif == ModifMyProfil.MODIF
              ? Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: coulWhite,
                      radius: 30,
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: coulCiel,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(coulYellow),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Modifier photo de profil',
                        style: TextStyle(
                            color: coulBlack,
                            fontFamily: fontHindMaduraiMedium,
                            fontSize: 16),
                      ),
                    ),
                  ],
                )
              : Container(),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            focusNode: modif == ModifMyProfil.MODIF
                ? focusController[0]
                : focusController[3],
            onFieldSubmitted: (term) {
              modif == ModifMyProfil.MODIF
                  ? focusController[0].unfocus()
                  : focusController[3].unfocus();
              modif == ModifMyProfil.MODIF
                  ? FocusScope.of(context).requestFocus(focusController[1])
                  : FocusScope.of(context).requestFocus(focusController[4]);
            },
            controller: modif == ModifMyProfil.MODIF
                ? textController[0]
                : textController[3],
            style: const TextStyle(
                fontFamily: fontHindMaduraiMedium,
                fontSize: 16,
                color: coulWhiteGrey),
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: coulWhiteGrey,
                ),
                // borderRadius: BorderRadius.(),
              ),
              hintText: "PlaceHolder",
              hintStyle: const TextStyle(
                  fontFamily: fontHindMaduraiMedium,
                  fontSize: 16,
                  color: coulWhiteGrey),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: coulWhiteGrey,
                ),
                // borderRadius: BorderRadius.circular(30.0),
              ),
              labelStyle: const TextStyle(
                color: coulWhiteGrey,
                fontFamily: fontHindMaduraiMedium,
                fontSize: 16,
              ),
              labelText: modif == ModifMyProfil.MODIF
                  ? "Votre pseudo"
                  : "Votre adresse mail",
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            focusNode: modif == ModifMyProfil.MODIF
                ? focusController[1]
                : focusController[4],
            onFieldSubmitted: (term) {
              modif == ModifMyProfil.MODIF
                  ? focusController[1].unfocus()
                  : focusController[4].unfocus();
              modif == ModifMyProfil.MODIF
                  ? FocusScope.of(context).requestFocus(focusController[2])
                  : FocusScope.of(context).requestFocus(focusController[5]);
            },
            controller: modif == ModifMyProfil.MODIF
                ? textController[1]
                : textController[4],
            style: const TextStyle(
                fontFamily: fontHindMaduraiMedium,
                fontSize: 16,
                color: coulWhiteGrey),
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: coulWhiteGrey,
                ),
                // borderRadius: BorderRadius.(),
              ),
              hintText: "PlaceHolder",
              hintStyle: const TextStyle(
                  fontFamily: fontHindMaduraiMedium,
                  fontSize: 16,
                  color: coulWhiteGrey),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: coulWhiteGrey,
                ),
                // borderRadius: BorderRadius.circular(30.0),
              ),
              labelStyle: const TextStyle(
                color: coulWhiteGrey,
                fontFamily: fontHindMaduraiMedium,
                fontSize: 16,
              ),
              labelText: modif == ModifMyProfil.MODIF
                  ? "Votre prénom"
                  : "Nouveau mot de passe",
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            focusNode: modif == ModifMyProfil.MODIF
                ? focusController[2]
                : focusController[5],
            onFieldSubmitted: (term) {
              modif == ModifMyProfil.MODIF
                  ? focusController[2].unfocus()
                  : focusController[5].unfocus();
            },
            controller: modif == ModifMyProfil.MODIF
                ? textController[2]
                : textController[5],
            style: const TextStyle(
                fontFamily: fontHindMaduraiMedium,
                fontSize: 16,
                color: coulWhiteGrey),
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: coulWhiteGrey,
                ),
                // borderRadius: BorderRadius.(),
              ),
              hintText: "PlaceHolder",
              hintStyle: const TextStyle(
                  fontFamily: fontHindMaduraiMedium,
                  fontSize: 16,
                  color: coulWhiteGrey),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: coulWhiteGrey,
                ),
                // borderRadius: BorderRadius.circular(30.0),
              ),
              labelStyle: const TextStyle(
                color: coulWhiteGrey,
                fontFamily: fontHindMaduraiMedium,
                fontSize: 16,
              ),
              labelText: modif == ModifMyProfil.MODIF
                  ? "Votre nom"
                  : "Confirmer nouveau mot de passe",
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          OutlinedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color?>(coulCiel),
              minimumSize: MaterialStateProperty.all<Size?>(
                const Size(500.0, 40.0),
              ),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                const EdgeInsets.fromLTRB(2.25, 11.25, 2.25, 11.25),
              ),
            ),
            onPressed: () {
              modif == ModifMyProfil.MODIF
                  ? print("modif reussi")
                  : print("edition reussi");
            },
            child: const Text(
              "Enregistrer",
              style: TextStyle(
                color: coulBlack,
                fontFamily: fontHindMaduraiMedium,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    ),
  );
}

Widget profilUser(
    WidgetRef ref,
    BuildContext context,
    ModifMyProfil modif,
    EditMyPasswordProfil edit,
    TypeProfil profil,
    TypeFollow follow,
    OptionFollower option) {
  return ListTile(
    leading: const CircleAvatar(
      backgroundColor: coulWhite,
      radius: 30,
      child: Icon(
        Icons.person,
        size: 50,
        color: coulCiel,
      ),
    ),
    title: const Text(
      "JohnDoe_",
      style: TextStyle(
          fontSize: 16, fontFamily: fontRubikRegular, color: coulWhite),
    ),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "John Doe",
          style: TextStyle(
              fontSize: 14,
              fontFamily: fontHindMaduraiRegular,
              color: coulWhite),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MoreUserWidget()));
          },
          child: Row(
            children: const [
              Text(
                "108",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: fontHindMaduraiRegular,
                    color: coulWhite),
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                Icons.person,
                size: 14,
                color: coulWhite,
              ),
              Text(
                "Amis",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: fontHindMaduraiRegular,
                    color: coulWhite),
              ),
            ],
          ),
        )
      ],
    ),
    trailing: SizedBox(
      width: 200,
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          modif == ModifMyProfil.UNMODIF
              ? ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(coulCiel),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (profil == TypeProfil.MYPROFIL) {
                      ref
                          .watch(modifMyProfilProvider.notifier)
                          .update((state) => ModifMyProfil.MODIF);
                      ref
                          .watch(editMyPasswordProfilProvider.notifier)
                          .update((state) => EditMyPasswordProfil.UNEDIT);
                    } else {
                      if (follow == TypeFollow.FOLLOW) {
                        ref
                            .watch(typeFollowStateProvider.notifier)
                            .update((state) => TypeFollow.UNFOLLOW);
                      } else {
                        ref
                            .watch(typeFollowStateProvider.notifier)
                            .update((state) => TypeFollow.FOLLOW);
                      }
                    }
                  },
                  child: Text(
                    profil == TypeProfil.MYPROFIL
                        ? "Modifier"
                        : follow == TypeFollow.UNFOLLOW
                            ? "Suivre"
                            : "Suivi(e)",
                    style: const TextStyle(
                        fontFamily: fontHindMaduraiMedium,
                        fontSize: 16,
                        color: coulBlack),
                  ),
                )
              : Container(),
          edit == EditMyPasswordProfil.UNEDIT
              ? IconButton(
                  onPressed: () {
                    if (profil == TypeProfil.MYPROFIL) {
                      ref
                          .watch(editMyPasswordProfilProvider.notifier)
                          .update((state) => EditMyPasswordProfil.EDIT);
                      ref
                          .watch(modifMyProfilProvider.notifier)
                          .update((state) => ModifMyProfil.UNMODIF);
                    } else {
                      if (option == OptionFollower.OPTION) {
                        ref
                            .watch(optionFollowerStateProvider.notifier)
                            .update((state) => OptionFollower.UNOPTION);
                      } else {
                        ref
                            .watch(optionFollowerStateProvider.notifier)
                            .update((state) => OptionFollower.OPTION);
                      }
                    }
                  },
                  icon: Icon(
                    profil == TypeProfil.MYPROFIL
                        ? Typicons.cog_outline
                        : option == OptionFollower.UNOPTION
                            ? Icons.more_vert
                            : Icons.close,
                    color: coulWhite,
                  ),
                )
              : Container(),
          modif == ModifMyProfil.MODIF || edit == EditMyPasswordProfil.EDIT
              ? IconButton(
                  onPressed: () {
                    if (modif == ModifMyProfil.MODIF) {
                      ref
                          .watch(modifMyProfilProvider.notifier)
                          .update((state) => ModifMyProfil.UNMODIF);
                    }
                    if (edit == EditMyPasswordProfil.EDIT) {
                      ref
                          .watch(editMyPasswordProfilProvider.notifier)
                          .update((state) => EditMyPasswordProfil.UNEDIT);
                    }
                  },
                  icon: const Icon(
                    Icons.close,
                    color: coulWhite,
                  ),
                )
              : Container(),
        ],
      ),
    ),
  );
}

Widget listEvenementLike(TypeFollow follow, TypeProfil profil) {
  if (follow == TypeFollow.FOLLOW || profil == TypeProfil.MYPROFIL) {
    return ListView.separated(
        padding: const EdgeInsets.all(5),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            height: 112,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/pictures/bar_chat.png"),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                  width: 1.0, color: coulBlack, style: BorderStyle.solid),
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            ),
            child: ListTile(
              onTap: () {},
              leading: Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/pictures/test.jpeg",
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Event name",
                        style: TextStyle(
                            fontFamily: fontHindMaduraiRegular,
                            fontSize: 16,
                            color: coulWhite),
                      ),
                      const Text(
                        "Description",
                        style: TextStyle(
                            fontFamily: fontHindMaduraiRegular,
                            fontSize: 14,
                            color: coulWhite),
                      ),
                    ],
                  ),
                ),
              ),
              // title: const Text(
              //   "Event name",
              //   style: TextStyle(
              //     fontFamily: fontHindMaduraiRegular,
              //     fontSize: 16,
              //   ),
              // ),
              // subtitle: const Text(
              //   "Description",
              //   style: TextStyle(
              //     fontFamily: fontHindMaduraiRegular,
              //     fontSize: 12,
              //   ),
              // ),
              trailing: Container(
                margin: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.bookmark_add,
                    size: 30,
                    color: coulYellow,
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 15,
          );
        },
        itemCount: 10);
  } else {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: const Text(
        'Veuillez suivre cet utilisateur pour voir ses évènements enregistrés',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: fontHindMaduraiBold, fontSize: 16, color: coulWhite),
      ),
    );
  }
}

Widget listSwipeLike(TypeFollow follow, TypeProfil profil) {
  if (follow == TypeFollow.FOLLOW || profil == TypeProfil.MYPROFIL) {
    return ListView.separated(
        padding: const EdgeInsets.all(5),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            height: 112,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/pictures/bar_chat.png"),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                  width: 1.0, color: coulBlack, style: BorderStyle.solid),
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            ),
            child: ListTile(
              onTap: () {},
              leading: Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/pictures/test.jpeg",
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Lieu",
                        style: TextStyle(
                            fontFamily: fontHindMaduraiRegular,
                            fontSize: 16,
                            color: coulWhite),
                      ),
                    ],
                  ),
                ),
              ),
              // title: const Text(
              //   "Event name",
              //   style: TextStyle(
              //     fontFamily: fontHindMaduraiRegular,
              //     fontSize: 16,
              //   ),
              // ),
              // subtitle: const Text(
              //   "Description",
              //   style: TextStyle(
              //     fontFamily: fontHindMaduraiRegular,
              //     fontSize: 12,
              //   ),
              // ),
              trailing: Container(
                margin: const EdgeInsets.fromLTRB(0, 27, 0, 0),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete_outline,
                    size: 40,
                    color: coulWhite,
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: 10);
  } else {
    return const Text(
      'Veuillez suivre cet utilisateur pour voir ses swipe enregistrés',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontFamily: fontHindMaduraiBold, fontSize: 16, color: coulWhite),
    );
  }
}
