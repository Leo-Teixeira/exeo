import 'package:exeo/screens/notification.dart';
import 'package:exeo/screens/setting.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/typicons_icons.dart';

const Color coulCiel = Color(0xFF0FBBE9);
const Color coulCielFonce = Color(0xFF4C89FF);
const Color coulBlue = Color(0xFF264AE8);
const Color coulPurple = Color(0xFF7C2ED9);
const Color coulYellow = Color(0xFFFFB74C);
const Color coulOrange = Color(0xFFFF774C);
const Color coulRed = Color(0xFFF04F1C);
const Color coulGreen = Color(0xFF03CC17);

const Color coulGrey = Color(0xFF232323);
const Color coulBlack = Color(0xFF141414);
const Color coulWhiteGrey = Color(0xFFACACAC);
const Color coulGreyGrey = Color(0xFFFEFEFE);
const Color coulWhite = Color(0xFFF5F5F5);

const String fontRubikLight = 'RubikLight';
const String fontRubikRegular = 'RubikRegular';
const String fontRubikMedium = 'RubikMedium';
const String fontRubikBold = 'RubikBold';

const String fontHindMaduraiLight = 'HindMaduraiLight';
const String fontHindMaduraiRegular = 'HindMaduraiRegular';
const String fontHindMaduraiMedium = 'HindMaduraiMedium';
const String fontHindMaduraiBold = 'HindMaduraiBold';

const String urlApi = "http://mdp01.mdstestangers.fr/";

/*
* Mise en place de l'appBar
*/

PreferredSizeWidget? appBarReception(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: coulBlack,
    title: Image.asset(
      "assets/pictures/MPD.png",
      width: 100,
      height: 100,
    ),
    actions: [
      IconButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const NotifWidget()));
        },
        icon: const Icon(
          Icons.notifications_none,
          color: coulWhite,
        ),
      ),
      IconButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const SettingWidget(),
            ),
          );
        },
        icon: const Icon(
          Typicons.cog_outline,
          color: coulWhite,
        ),
      ),
    ],
  );
}
