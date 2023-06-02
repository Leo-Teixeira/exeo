import 'package:exeo/models/category_model.dart';
import 'package:exeo/models/event_model.dart';
import 'package:exeo/provider/event_provider.dart';
import 'package:exeo/provider/reception_provider.dart';
import 'package:exeo/screens/more_activities.dart';
import 'package:exeo/screens/more_event.dart';
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
    AsyncValue<List<Events>> listEvent = ref.watch(getEvenementsLimit(5));
    AsyncValue<List<Category>> listActivite = ref.watch(getActivite);

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
                  style: TextStyle(
                      fontSize: 28,
                      fontFamily: fontRubikRegular,
                      color: coulWhite),
                ),
              ),
              listEvent.when(
                data: (events) {
                  return Column(children: [
                    for (int i = 0; i < 5; i++)
                      Column(
                        children: [
                          const SizedBox(
                            height: 17,
                          ),
                          Container(
                            height: 130,
                            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(events[i].picture != ""
                                    ? "http://mdp01.mdstestangers.fr${events[i].picture}"
                                    : "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/MacOS_prohibitory_symbol.svg/1200px-MacOS_prohibitory_symbol.svg.png"),
                                fit: BoxFit.cover,
                              ),
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
                                    builder: (context) => MoreInfoWidget(
                                      info_event: events[i],
                                    ),
                                  ),
                                );
                              },
                              leading: Container(
                                margin: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                                padding:
                                    const EdgeInsets.fromLTRB(0, 16, 0, 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      events[i].logo == ""
                                          ? "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/MacOS_prohibitory_symbol.svg/1200px-MacOS_prohibitory_symbol.svg.png"
                                          : "http://mdp01.mdstestangers.fr${events[i].logo}",
                                      width: 40,
                                      height: 40,
                                    ),
                                    const SizedBox(
                                      height: 22,
                                    ),
                                    Text(
                                      events[i].title,
                                      style: TextStyle(
                                          fontFamily: fontHindMaduraiRegular,
                                          fontSize: 16,
                                          color: coulWhite),
                                    ),
                                    Text(
                                      truncateText(events[i].subtitle, 100),
                                      style: TextStyle(
                                          fontFamily: fontHindMaduraiRegular,
                                          fontSize: 12,
                                          color: coulWhite),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // trailing: Container(
                            //   margin: const EdgeInsets.fromLTRB(0, 45, 0, 0),
                            //   child: IconButton(
                            //     onPressed: () {
                            //       if (favoris == AddFavoris.FAVORIS) {
                            //         ref
                            //             .watch(
                            //                 addFavorisStateProvider.notifier)
                            //             .update(
                            //                 (state) => AddFavoris.UNFAVORIS);
                            //       } else {
                            //         ref
                            //             .watch(
                            //                 addFavorisStateProvider.notifier)
                            //             .update(
                            //                 (state) => AddFavoris.FAVORIS);
                            //       }
                            //     },
                            //     icon: favoris == AddFavoris.UNFAVORIS
                            //         ? const Icon(
                            //             Icons.bookmark_add_outlined,
                            //             size: 30,
                            //             color: coulWhite,
                            //           )
                            //         : const Icon(
                            //             Icons.bookmark,
                            //             color: coulYellow,
                            //             size: 30,
                            //           ),
                            //   ),
                            // ),
                          ),
                        ],
                      )
                  ]);
                },
                error: (err, stack) {
                  print(err);
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              TextButton(
                onPressed: () {
                  ref
                      .watch(typeListReceptionProviderState.notifier)
                      .update((state) => TypeListReception.EVENEMENT);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MoreEvent()));
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(sizeWidth / 2.5, 0, 0, 0),
                  child: const Text(
                    "Voir plus",
                    style: TextStyle(
                      fontFamily: fontHindMaduraiMedium,
                      fontSize: 14,
                      color: coulWhite,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: const Text(
                      "Les Activités",
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: fontRubikRegular,
                        color: coulWhite,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: listActivite.when(
                      data: (activites) {
                        return GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          children: List.generate(6, (index) {
                            return GestureDetector(
                              onTap: () {
                                ref
                                    .watch(
                                        typeListReceptionProviderState.notifier)
                                    .update(
                                        (state) => TypeListReception.ACTIVITE);
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const MoreEvent(),
                                  ),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: coulBlack,
                                  border: Border.all(
                                    width: 1.0,
                                    color: coulBlack,
                                    style: BorderStyle.solid,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
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
                                          style: BorderStyle.solid,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(8.0),
                                        ),
                                      ),
                                      child: Image.network(
                                        "http://mdp01.mdstestangers.fr${activites[index].content!}",
                                        width: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        "${activites[index].name}",
                                        style: const TextStyle(
                                          fontFamily: fontHindMaduraiMedium,
                                          fontSize: 16,
                                          color: coulWhite,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        );
                      },
                      error: (err, stack) {
                        return Text(err.toString());
                      },
                      loading: () {
                        return const Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MoreActivities(),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(sizeWidth / 2.5, 0, 0, 0),
                      child: const Text(
                        "Voir plus",
                        style: TextStyle(
                          fontFamily: fontHindMaduraiMedium,
                          fontSize: 14,
                          color: coulWhite,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
