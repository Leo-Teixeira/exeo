// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:exeo/provider/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:exeo/models/event_model.dart';
import 'package:exeo/provider/reception_provider.dart';
import 'package:exeo/screens/more_user.dart';
import 'package:exeo/services/constant.dart';

class MoreInfoWidget extends ConsumerWidget {
  final Events? info_event;
  final AllEvents? info_event_all;
  const MoreInfoWidget({Key? key, this.info_event, this.info_event_all})
      : super(key: key);

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              titlePage(context),
              const SizedBox(
                height: 24,
              ),
              info_event_all == null
                  ? BodyPage(
                      infoEvent: info_event,
                    )
                  : BodyPage(
                      infoAllEvent: info_event_all,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget titlePage(BuildContext context) {
  return Row(
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
      const Text(
        "Retour",
        style: TextStyle(
            fontFamily: fontHindMaduraiLight, fontSize: 16, color: coulWhite),
      ),
    ],
  );
}

class BodyPage extends ConsumerStatefulWidget {
  final Events? infoEvent;
  final AllEvents? infoAllEvent;
  const BodyPage({super.key, this.infoEvent, this.infoAllEvent});

  @override
  ConsumerState<BodyPage> createState() => _BodyPageState();
}

class _BodyPageState extends ConsumerState<BodyPage> {
  Events? get infoEvent => widget.infoEvent;
  AllEvents? get infoAllEvent => widget.infoAllEvent;
  @override
  Widget build(BuildContext context) {
    TypeInfo type = ref.watch(typeInfoStateProvider);
    AddFavoris typeFavoris = ref.watch(addFavorisStateProvider);
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(infoEvent == null && infoAllEvent!.picture != ""
              ? infoAllEvent!.picture
              : infoEvent!.picture != "" && infoAllEvent == null
                  ? infoEvent!.picture
                  : "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/MacOS_prohibitory_symbol.svg/1200px-MacOS_prohibitory_symbol.svg.png"),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                type == TypeInfo.EVENEMENT && infoAllEvent == null
                    ? infoEvent!.title
                    : type == TypeInfo.EVENEMENT && infoEvent == null
                        ? infoAllEvent!.title
                        : "",
                style: const TextStyle(
                    fontFamily: fontRubikMedium,
                    fontSize: 20,
                    color: coulWhite),
              ),
              RatingBar.builder(
                itemSize: 20,
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                ignoreGestures: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            type == TypeInfo.EVENEMENT && infoAllEvent == null
                ? infoEvent!.title
                : type == TypeInfo.EVENEMENT && infoEvent == null
                    ? infoAllEvent!.title
                    : "",
            style: TextStyle(
                fontFamily: fontRubikMedium, fontSize: 16, color: coulWhite),
          ),
          const SizedBox(
            height: 8,
          ),
          //!mettre un listView builder pour afficher tous les avatar en plus
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MoreUserWidget()));
            },
            child: Row(
              children: const [
                // Container(
                //   width: 20,
                //   child: Stack(
                //     children: [
                //       for (int i = 0; i < 5; i++)
                //         Positioned(
                //           left: 10 + i.toDouble(),
                //           child: CircleAvatar(
                //             radius: 10,
                //           ),
                //         )
                //     ],
                //   ),
                // ),
                // const SizedBox(
                //   width: 10,
                // ),
                Text(
                  "+ de 300 pers. suivent l'évènement",
                  style: TextStyle(
                      fontFamily: fontHindMaduraiRegular,
                      fontSize: 12,
                      color: coulWhite),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: const [
              Text(
                "JaneDoe et Carlos suivent l'évènement",
                style: TextStyle(
                    fontFamily: fontHindMaduraiRegular,
                    fontSize: 12,
                    color: coulWhite),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          typeFavoris == AddFavoris.UNFAVORIS
              ? ElevatedButton(
                  onPressed: () async {
                    ref.watch(eventLikeProvider(infoAllEvent == null
                        ? infoEvent!.id
                        : infoAllEvent!.id));
                    ref
                        .watch(addFavorisStateProvider.notifier)
                        .update((state) => AddFavoris.FAVORIS);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder?>(
                        RoundedRectangleBorder(
                            side: BorderSide(
                              color: type == TypeInfo.EVENEMENT
                                  ? coulCiel
                                  : coulGreen,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8))),
                    backgroundColor: type == TypeInfo.EVENEMENT
                        ? MaterialStateProperty.all<Color?>(coulBlack)
                        : MaterialStateProperty.all<Color?>(coulGreen),
                    minimumSize: MaterialStateProperty.all<Size?>(
                      const Size(500.0, 40.0),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                      const EdgeInsets.fromLTRB(2.25, 11.25, 2.25, 11.25),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        type == TypeInfo.EVENEMENT
                            ? "Suivre l'évènement"
                            : "Sauvegarder",
                        style: TextStyle(
                          color:
                              type == TypeInfo.EVENEMENT ? coulCiel : coulBlack,
                          fontFamily: fontHindMaduraiMedium,
                          fontSize: 16,
                        ),
                      ),
                      type == TypeInfo.EVENEMENT
                          ? const Icon(
                              Icons.bookmark_add_outlined,
                              color: coulCiel,
                            )
                          : Container()
                    ],
                  ),
                )
              : ElevatedButton(
                  onPressed: () {
                    ref.watch(deleteEventLikeProvider(infoAllEvent == null
                        ? infoEvent!.id
                        : infoAllEvent!.id));
                    ref
                        .watch(addFavorisStateProvider.notifier)
                        .update((state) => AddFavoris.UNFAVORIS);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder?>(
                        RoundedRectangleBorder(
                            side: BorderSide(
                              color: type == TypeInfo.EVENEMENT
                                  ? coulCiel
                                  : coulGreen,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8))),
                    backgroundColor: type == TypeInfo.EVENEMENT
                        ? MaterialStateProperty.all<Color?>(coulCiel)
                        : MaterialStateProperty.all<Color?>(coulGreen),
                    minimumSize: MaterialStateProperty.all<Size?>(
                      const Size(500.0, 40.0),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                      const EdgeInsets.fromLTRB(2.25, 11.25, 2.25, 11.25),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Ne plus suivre",
                        style: TextStyle(
                          color: coulBlack,
                          fontFamily: fontHindMaduraiMedium,
                          fontSize: 16,
                        ),
                      ),
                      type == TypeInfo.EVENEMENT
                          ? Icon(
                              typeFavoris == AddFavoris.UNFAVORIS
                                  ? Icons.bookmark_add_outlined
                                  : Icons.bookmark,
                              color: typeFavoris == AddFavoris.UNFAVORIS
                                  ? coulCiel
                                  : coulYellow,
                            )
                          : Container()
                    ],
                  ),
                ),
          const SizedBox(
            height: 12,
          ),
          typeFavoris == AddFavoris.UNFAVORIS
              ? ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder?>(
                        RoundedRectangleBorder(
                            side: const BorderSide(
                              color: coulCiel,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8))),
                    backgroundColor: type == TypeInfo.LIEU
                        ? MaterialStateProperty.all<Color?>(coulBlack)
                        : MaterialStateProperty.all<Color?>(coulCiel),
                    minimumSize: MaterialStateProperty.all<Size?>(
                      const Size(500.0, 40.0),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                      const EdgeInsets.fromLTRB(2.25, 11.25, 2.25, 11.25),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        type == TypeInfo.EVENEMENT
                            ? "Participer"
                            : "Enregistrer l'évènement",
                        style: TextStyle(
                          color: type == TypeInfo.LIEU ? coulCiel : coulBlack,
                          fontFamily: fontHindMaduraiMedium,
                          fontSize: 16,
                        ),
                      ),
                      type == TypeInfo.LIEU
                          ? const Icon(
                              Icons.bookmark_add_outlined,
                              color: coulCiel,
                            )
                          : Container()
                    ],
                  ),
                )
              : Container(),
          const SizedBox(
            height: 24,
          ),
          Text(
            type == TypeInfo.EVENEMENT && infoAllEvent == null
                ? infoEvent!.description
                : type == TypeInfo.EVENEMENT && infoEvent == null
                    ? infoAllEvent!.description
                    : "",
            style: const TextStyle(
              fontFamily: fontHindMaduraiMedium,
              fontSize: 16,
              color: coulWhite,
            ),
          )
        ],
      ),
    );
  }
}
