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
      backgroundColor: coulBlack,
      appBar: appBarReception(context),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("./assets/pictures/real_background.png"),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 17,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: const Text(
                  "Les évènements",
                  style: TextStyle(fontSize: 28, fontFamily: fontRubikRegular),
                ),
              ),
              for (int i = 0; i < 5; i++)
                Column(
                  children: [
                    const SizedBox(
                      height: 17,
                    ),
                    Container(
                      height: 130,
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
                          ref
                              .watch(typeInfoStateProvider.notifier)
                              .update((state) => TypeInfo.EVENEMENT);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const MoreInfoWidget(),
                            ),
                          );
                        },
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
                                  height: 22,
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
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // title: Column(
                        //   children: [
                        //     Image.asset("assets/pictures/test.jpeg"),
                        //     const Text(
                        //       "Event name",
                        //       style: TextStyle(
                        //         fontFamily: fontHindMaduraiRegular,
                        //         fontSize: 16,
                        //       ),
                        //     ),
                        //     const Text(
                        //       "Description",
                        //       style: TextStyle(
                        //         fontFamily: fontHindMaduraiRegular,
                        //         fontSize: 12,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // subtitle: const Text(
                        //   "Description",
                        //   style: TextStyle(
                        //     fontFamily: fontHindMaduraiRegular,
                        //     fontSize: 12,
                        //   ),
                        // ),
                        trailing: Container(
                          margin: const EdgeInsets.fromLTRB(0, 45, 0, 0),
                          child: IconButton(
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
                                    size: 30,
                                  )
                                : const Icon(
                                    Icons.bookmark,
                                    color: coulYellow,
                                    size: 30,
                                  ),
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
                child: Container(
                  margin: EdgeInsets.fromLTRB(sizeWidth / 2.5, 0, 0, 0),
                  child: const Text("Voir plus"),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: const Text(
                  "Les Activités",
                  style: TextStyle(fontSize: 28, fontFamily: fontRubikRegular),
                ),
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
                                ref
                                    .watch(typeInfoStateProvider.notifier)
                                    .update((state) => TypeInfo.LIEU);
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const MoreInfoWidget(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 143,
                                margin: const EdgeInsets.all(10),
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
                                      margin: const EdgeInsets.all(10),
                                      width: 170,
                                      height: 80,
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
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: const Text(
                                        "Title",
                                        style: TextStyle(
                                            fontFamily: fontHindMaduraiMedium,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: const Text(
                                        "Title",
                                        style: TextStyle(
                                            fontFamily: fontHindMaduraiMedium,
                                            fontSize: 12),
                                      ),
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
                child: Container(
                  margin: EdgeInsets.fromLTRB(sizeWidth / 2.5, 0, 0, 0),
                  child: const Text("Voir plus"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
