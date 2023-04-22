import 'package:exeo/provider/profil_provider.dart';
import 'package:exeo/screens/profil.dart';
import 'package:exeo/services/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoreUserWidget extends ConsumerWidget {
  //! une fois que j'aurais les données, prendre les valeurs de l'évènement ou du nombre de follower de la personne et le stocker dans une variable
  //! à placer dans un stateProvider
  const MoreUserWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
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
            titlePage(context),
            listUserPage(ref, context),
          ],
        ),
      ),
    );
  }
}

Widget titlePage(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(left: 15, right: 15),
    child: Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
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

Widget listUserPage(WidgetRef ref, BuildContext context) {
  TypeFollow follow = ref.watch(typeFollowStateProvider);
  return Expanded(
    child: ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            //! changer le ref du follow selon les données de l'utilisateur
            ref
                .watch(typeProfilStateProvider.notifier)
                .update((state) => TypeProfil.OTHERPROFIL);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ProfilWidget(),
              ),
            );
          },
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
          subtitle: const Text(
            "John Doe",
            style: TextStyle(
                fontSize: 14,
                fontFamily: fontHindMaduraiRegular,
                color: coulWhite),
          ),
          trailing: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(coulCiel),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
            onPressed: () {
              //! Changer les ref pour envoyer par la suite directement une requête d'api
              if (follow == TypeFollow.FOLLOW) {
                ref
                    .watch(typeFollowStateProvider.notifier)
                    .update((state) => TypeFollow.UNFOLLOW);
              } else {
                ref
                    .watch(typeFollowStateProvider.notifier)
                    .update((state) => TypeFollow.FOLLOW);
              }
            },
            child: Text(
              //! verifier par la suite grâce au stateProvider et les données renvoyer par l'api
              follow == TypeFollow.UNFOLLOW ? "Suivre" : "Suivi(e)",
              style: const TextStyle(
                  fontFamily: fontHindMaduraiMedium,
                  fontSize: 16,
                  color: coulBlack),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          color: coulWhite,
          height: 0,
        );
      },
      itemCount: 30,
    ),
  );
}
