import 'dart:ui';

import 'package:exeo/services/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotifWidget extends ConsumerWidget {
  const NotifWidget({super.key});

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Demande de suivi",
              style: TextStyle(
                  fontSize: 25, color: coulWhite, fontFamily: fontRubikLight),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 3,
                  sigmaY: 3), // Ajustez les valeurs de flou selon vos besoins
              child: Container(
                color: Colors
                    .transparent, // Couleur transparente pour appliquer le flou sans changer la couleur de fond
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(30),
                  color: Colors.white,
                  child: Column(
                    children: [
                      const Text(
                        "Page en cours de développement",
                        style: TextStyle(
                            fontSize: 18, fontFamily: fontHindMaduraiBold),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Retour",
                          style: TextStyle(
                              color: coulOrange,
                              fontFamily: fontHindMaduraiBold,
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
