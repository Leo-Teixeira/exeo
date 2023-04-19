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
          children: const [
            SizedBox(
              height: 15,
            ),
            Text(
              "Demande de suivi",
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
