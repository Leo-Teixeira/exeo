import 'package:exeo/provider/profil_provider.dart';
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
              const SizedBox(
                height: 10,
              ),
              profilUser(ref, modif, edit),
              modif == ModifMyProfil.MODIF || edit == EditMyPasswordProfil.EDIT
                  ? modifUser(context, modif)
                  : Container(),
              tabBarEventSwipe(),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    listEvenementLike(),
                    listSwipeLike(),
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

Widget tabBarEventSwipe() {
  return TabBar(
    tabs: [
      Tab(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.bookmark_add,
              color: coulBlack,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Evenements",
              style: TextStyle(color: coulBlack),
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
              color: coulBlack,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Swipe",
              style: TextStyle(color: coulBlack),
            ),
          ],
        ),
      )
    ],
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
      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Column(
        children: [
          const SizedBox(height: 18),
          modif == ModifMyProfil.MODIF
              ? Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      child: Icon(
                        Icons.person,
                        size: 50,
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
            ),
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: coulGrey,
                ),
                // borderRadius: BorderRadius.(),
              ),
              hintText: "PlaceHolder",
              hintStyle: const TextStyle(
                fontFamily: fontHindMaduraiMedium,
                fontSize: 16,
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: coulGrey,
                ),
                // borderRadius: BorderRadius.circular(30.0),
              ),
              labelStyle: const TextStyle(
                color: coulGrey,
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
            ),
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: coulGrey,
                ),
                // borderRadius: BorderRadius.(),
              ),
              hintText: "PlaceHolder",
              hintStyle: const TextStyle(
                fontFamily: fontHindMaduraiMedium,
                fontSize: 16,
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: coulGrey,
                ),
                // borderRadius: BorderRadius.circular(30.0),
              ),
              labelStyle: const TextStyle(
                color: coulGrey,
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
            ),
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: coulGrey,
                ),
                // borderRadius: BorderRadius.(),
              ),
              hintText: "PlaceHolder",
              hintStyle: const TextStyle(
                fontFamily: fontHindMaduraiMedium,
                fontSize: 16,
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: coulGrey,
                ),
                // borderRadius: BorderRadius.circular(30.0),
              ),
              labelStyle: const TextStyle(
                color: coulGrey,
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
    WidgetRef ref, ModifMyProfil modif, EditMyPasswordProfil edit) {
  return ListTile(
    leading: const CircleAvatar(
      radius: 30,
      child: Icon(
        Icons.person,
        size: 50,
      ),
    ),
    title: const Text(
      "JohnDoe_",
      style: TextStyle(fontSize: 16, fontFamily: fontRubikRegular),
    ),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "John Doe",
          style: TextStyle(fontSize: 14, fontFamily: fontHindMaduraiRegular),
        ),
        GestureDetector(
          onTap: () {
            //! faire la page qui liste tous les amis de mon profil
          },
          child: Row(
            children: const [
              Text(
                "108",
                style:
                    TextStyle(fontSize: 14, fontFamily: fontHindMaduraiRegular),
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                Icons.person,
                size: 14,
              ),
              Text(
                "Amis",
                style:
                    TextStyle(fontSize: 14, fontFamily: fontHindMaduraiRegular),
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
                    ref
                        .watch(modifMyProfilProvider.notifier)
                        .update((state) => ModifMyProfil.MODIF);
                    ref
                        .watch(editMyPasswordProfilProvider.notifier)
                        .update((state) => EditMyPasswordProfil.UNEDIT);
                  },
                  child: const Text(
                    "Modifier",
                    style: TextStyle(
                        fontFamily: fontHindMaduraiMedium,
                        fontSize: 16,
                        color: coulBlack),
                  ),
                )
              : Container(),
          edit == EditMyPasswordProfil.UNEDIT
              ? IconButton(
                  onPressed: () {
                    ref
                        .watch(editMyPasswordProfilProvider.notifier)
                        .update((state) => EditMyPasswordProfil.EDIT);
                    ref
                        .watch(modifMyProfilProvider.notifier)
                        .update((state) => ModifMyProfil.UNMODIF);
                  },
                  icon: const Icon(
                    Typicons.cog_outline,
                    color: coulBlack,
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
                  icon: const Icon(Icons.close),
                )
              : Container(),
        ],
      ),
    ),
  );
}

Widget listEvenementLike() {
  return ListView.separated(
      padding: const EdgeInsets.all(5),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
          height: 112,
          decoration: BoxDecoration(
            border: Border.all(
                width: 1.0, color: coulBlack, style: BorderStyle.solid),
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
          child: ListTile(
            onTap: () {},
            leading: Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(24, 0, 0, 0),
                padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
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
                      ),
                    ),
                    const Text(
                      "Description",
                      style: TextStyle(
                        fontFamily: fontHindMaduraiRegular,
                        fontSize: 14,
                      ),
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
                icon: const Icon(FontAwesome5.bookmark),
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
}

Widget listSwipeLike() {
  return ListView.separated(
      padding: const EdgeInsets.all(5),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
          height: 112,
          decoration: BoxDecoration(
            border: Border.all(
                width: 1.0, color: coulBlack, style: BorderStyle.solid),
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
          child: ListTile(
            onTap: () {},
            leading: Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(24, 0, 0, 0),
                padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
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
                      ),
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
}
