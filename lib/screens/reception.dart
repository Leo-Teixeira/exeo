import 'package:exeo/screens/login.dart';
import 'package:exeo/services/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class ReceptionPage extends ConsumerWidget {
  ReceptionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: appBarReception(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 17,
          ),
          const Text(
            "Les évènements",
            style: TextStyle(fontSize: 23.7),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 3,
              itemBuilder: ((context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1.0, color: coulBlack, style: BorderStyle.solid),
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: ListTile(
                    onTap: () {},
                    leading: Image.asset("assets/pictures/test.jpeg"),
                    title: const Text(
                      "Event name",
                      style: TextStyle(
                        fontFamily: fontHindMaduraiRegular,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: const Text(
                      "Description",
                      style: TextStyle(
                        fontFamily: fontHindMaduraiRegular,
                        fontSize: 12,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(FontAwesome5.bookmark),
                    ),
                  ),
                );
              }),
              padding: const EdgeInsets.all(21),
              separatorBuilder: ((context, index) {
                return const SizedBox(
                  height: 12,
                );
              }),
            ),
          ),
          TextButton(onPressed: () {}, child: const Text("Voir plus")),
          const Text(
            "Les activités",
            style: TextStyle(fontSize: 23.7),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 3,
              itemBuilder: ((context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1.0, color: coulBlack, style: BorderStyle.solid),
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: ListTile(
                    onTap: () {},
                    leading: Image.asset("assets/pictures/test.jpeg"),
                    title: const Text(
                      "Event name",
                      style: TextStyle(
                        fontFamily: fontHindMaduraiRegular,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: const Text(
                      "Description",
                      style: TextStyle(
                        fontFamily: fontHindMaduraiRegular,
                        fontSize: 12,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(FontAwesome5.bookmark),
                    ),
                  ),
                );
              }),
              padding: const EdgeInsets.all(21),
              separatorBuilder: ((context, index) {
                return const SizedBox(
                  height: 12,
                );
              }),
            ),
          ),
          TextButton(onPressed: () {}, child: const Text("Voir plus")),
        ],
      ),
    );
  }
}
