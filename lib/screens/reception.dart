import 'package:exeo/provider/reception_provider.dart';
import 'package:exeo/screens/more_info.dart';
import 'package:exeo/services/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class ReceptionPage extends ConsumerWidget {
  const ReceptionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    double sizeHeight = size.height;
    double sizeWidth = size.width;

    AddFavoris favoris = ref.watch(addFavorisStateProvider);

    return Scaffold(
      appBar: appBarReception(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 17,
            ),
            const Text(
              "Les évènements",
              style: TextStyle(fontSize: 23.7),
            ),
            for (int i = 0; i < 5; i++)
              Column(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1.0,
                          color: coulBlack,
                          style: BorderStyle.solid),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MoreInfoWidget(),
                          ),
                        );
                      },
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
                        onPressed: () {
                          if (favoris == AddFavoris.FAVORIS) {
                            ref
                                .watch(addFavorisStateProvider.notifier)
                                .update((state) => AddFavoris.UNFAVORIS);
                          } else {
                            ref
                                .watch(addFavorisStateProvider.notifier)
                                .update((state) => AddFavoris.FAVORIS);
                          }
                        },
                        icon: favoris == AddFavoris.UNFAVORIS
                            ? const Icon(
                                Icons.bookmark_add_outlined,
                                size: 40,
                              )
                            : const Icon(
                                Icons.bookmark,
                                color: coulYellow,
                                size: 40,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            TextButton(
              onPressed: () {
                //! faire la page pour avoir la liste de tous les évènements
              },
              child: const Text("Voir plus"),
            ),
            const Text(
              "Les Activités",
              style: TextStyle(fontSize: 23.7),
            ),
            for (int i = 0; i < 3; i++)
              Column(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      for (int i = 0; i < 2; i++)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const MoreInfoWidget(),
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.0,
                                    color: coulBlack,
                                    style: BorderStyle.solid),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    width: 170,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                          width: 1.0,
                                          color: coulBlack,
                                          style: BorderStyle.solid),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8.0)),
                                    ),
                                    child: Image.asset(
                                      "assets/pictures/test.jpeg",
                                      width: 100,
                                    ),
                                  ),
                                  const Text(
                                    "Title",
                                    style: TextStyle(
                                        fontFamily: fontHindMaduraiMedium,
                                        fontSize: 16),
                                  ),
                                  const Text(
                                    "Title",
                                    style: TextStyle(
                                        fontFamily: fontHindMaduraiMedium,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            TextButton(
              onPressed: () {},
              child: const Text("Voir plus"),
            ),
          ],
        ),
      ),
    );
  }
}
