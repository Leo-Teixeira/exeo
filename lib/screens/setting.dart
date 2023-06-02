import 'package:exeo/provider/settings_provider.dart';
import 'package:exeo/screens/cgu.dart';
import 'package:exeo/screens/login.dart';
import 'package:exeo/screens/support.dart';
import 'package:exeo/services/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingWidget extends ConsumerWidget {
  const SettingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeModeApp theme = ref.watch(themeModeProviderState);
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
                        "Paramètres",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: fontRubikMedium,
                            color: coulWhite),
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
            ),
            darkMode(ref, theme),
            contactSupport(context),
            cgu(context),
            btnDeconnect(context),
            const SizedBox(
              height: 10,
            ),
            btnSuppCompte(),
          ],
        ),
      ),
    );
  }
}

Widget darkMode(WidgetRef ref, ThemeModeApp theme) {
  return ListTile(
    leading: const Icon(
      Icons.dark_mode_outlined,
      color: coulWhite,
    ),
    // ! changer le text selon si darkMode actif ou non
    title: theme == ThemeModeApp.LIGHTMODE
        ? const Text(
            "Activer le dark mode",
            style: TextStyle(
                fontFamily: fontHindMaduraiLight,
                fontSize: 16,
                color: coulWhite),
          )
        : const Text('Désactiver le dark mode',
            style: TextStyle(
                fontFamily: fontHindMaduraiLight,
                fontSize: 16,
                color: coulWhite)),
    trailing: Switch(
      onChanged: (value) {
        if (value == true) {
          ref
              .watch(themeModeProviderState.notifier)
              .update((state) => ThemeModeApp.DARKMODE);
        } else {
          ref
              .watch(themeModeProviderState.notifier)
              .update((state) => ThemeModeApp.LIGHTMODE);
        }
      },
      value: theme == ThemeModeApp.DARKMODE ? true : false,
      // activeColor: Colors.blue,
      // activeTrackColor: Colors.yellow,
      // inactiveThumbColor: Colors.redAccent,
      // inactiveTrackColor: Colors.orange,
    ),
  );
}

Widget contactSupport(BuildContext context) {
  return ListTile(
    leading: const Icon(
      Icons.help,
      color: coulWhite,
    ),
    title: const Text(
      "Contacter le support",
      style: TextStyle(
          fontFamily: fontHindMaduraiLight, fontSize: 16, color: coulWhite),
    ),
    trailing: IconButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const SupportWidget(),
          ),
        );
      },
      icon: const Icon(
        Icons.arrow_forward_ios,
        color: coulWhite,
      ),
    ),
  );
}

Widget cgu(BuildContext context) {
  return ListTile(
    leading: const Icon(
      Icons.info_outline,
      color: coulWhite,
    ),
    title: const Text(
      "Conditions Générales d'Utilisation",
      style: TextStyle(
          fontFamily: fontHindMaduraiLight, fontSize: 16, color: coulWhite),
    ),
    trailing: IconButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CGU(),
          ),
        );
      },
      icon: const Icon(
        Icons.arrow_forward_ios,
        color: coulWhite,
      ),
    ),
  );
}

Widget btnDeconnect(BuildContext context) {
  return Container(
    margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
    child: ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginWidget(),
          ),
        );
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color?>(coulCiel),
        minimumSize: MaterialStateProperty.all<Size?>(
          const Size(500.0, 40.0),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
          const EdgeInsets.fromLTRB(2.25, 11.25, 2.25, 11.25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Déconnexion",
            style: TextStyle(
              color: coulBlack,
              fontFamily: fontHindMaduraiMedium,
              fontSize: 16,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.logout,
            color: coulBlack,
          )
        ],
      ),
    ),
  );
}

Widget btnSuppCompte() {
  return Container(
    margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
    child: ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        shape:
            MaterialStateProperty.all<OutlinedBorder?>(RoundedRectangleBorder(
                side: const BorderSide(
                  color: coulCiel,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8))),
        backgroundColor: MaterialStateProperty.all<Color?>(coulBlack),
        minimumSize: MaterialStateProperty.all<Size?>(
          const Size(500.0, 40.0),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
          const EdgeInsets.fromLTRB(2.25, 11.25, 2.25, 11.25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Supprimer mon compte",
            style: TextStyle(
              color: coulCiel,
              fontFamily: fontHindMaduraiMedium,
              fontSize: 16,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.delete_outline,
            color: coulCiel,
          )
        ],
      ),
    ),
  );
}
