import 'package:exeo/provider/settings_provider.dart';
import 'package:exeo/screens/support.dart';
import 'package:exeo/services/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
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
              margin: const EdgeInsets.fromLTRB(15, 15, 0, 0),
              child: const Text(
                "Paramètres : ",
                style: TextStyle(fontSize: 20, fontFamily: fontRubikMedium),
              ),
            ),
            darkMode(ref, theme),
            contactSupport(context),
            cgu(),
            btnDeconnect(),
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
    leading: const Icon(Icons.dark_mode_outlined),
    // ! changer le text selon si darkMode actif ou non
    title: theme == ThemeModeApp.LIGHTMODE
        ? const Text(
            "Activer le dark mode",
            style: TextStyle(fontFamily: fontHindMaduraiLight, fontSize: 16),
          )
        : const Text('Désactiver le dark mode',
            style: TextStyle(fontFamily: fontHindMaduraiLight, fontSize: 16)),
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
    ),
    title: const Text(
      "Contacter le support",
      style: TextStyle(fontFamily: fontHindMaduraiLight, fontSize: 16),
    ),
    trailing: IconButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const SupportWidget(),
          ),
        );
      },
      icon: const Icon(Icons.arrow_forward_ios),
    ),
  );
}

Widget cgu() {
  return ListTile(
    leading: const Icon(Icons.info_outline),
    title: const Text(
      "Conditions Générales d'Utilisation",
      style: TextStyle(fontFamily: fontHindMaduraiLight, fontSize: 16),
    ),
    trailing: Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 12, 0),
      child: const Icon(Icons.arrow_forward_ios),
    ),
  );
}

Widget btnDeconnect() {
  return Container(
    margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
    child: ElevatedButton(
      onPressed: () {},
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
