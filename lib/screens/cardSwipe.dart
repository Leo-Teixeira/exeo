import 'package:exeo/models/event_model.dart';
import 'package:exeo/provider/reception_provider.dart';
import 'package:exeo/screens/more_info.dart';
import 'package:exeo/services/constant.dart';
import 'package:exeo/services/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SwipeCardWidget extends ConsumerWidget {
  final Events event;

  const SwipeCardWidget(
    this.event, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String desc = event.description;
    return GestureDetector(
      onTap: () {
        ref
            .watch(typeInfoStateProvider.notifier)
            .update((state) => TypeInfo.LIEU);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MoreInfoWidget(info_event: event),
          ),
        );
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: coulBlack,
          boxShadow: [
            BoxShadow(
              color: coulGrey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            )
          ],
        ),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                child: Image.network(event.picture != ""
                    ? "http://mdp01.mdstestangers.fr${event.picture}"
                    : "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/MacOS_prohibitory_symbol.svg/1200px-MacOS_prohibitory_symbol.svg.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: const TextStyle(
                      color: coulWhite,
                      fontFamily: fontRubikMedium,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  for (int i = 0; i < 2; i++)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int i = 0; i < 3; i++)
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  side: BorderSide(width: 1, color: coulWhite),
                                ),
                              ),
                            ),
                            child: Text(
                              event.Category,
                              style: const TextStyle(
                                  fontFamily: fontHindMaduraiMedium,
                                  fontSize: 16,
                                  color: coulWhite),
                            ),
                          ),
                      ],
                    ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      Text(
                        desc.length < 100
                            ? desc
                            : "${desc.substring(0, 100)}...",
                        style: const TextStyle(
                            color: coulWhite,
                            fontFamily: fontHindMaduraiRegular,
                            fontSize: 16),
                      ),
                      desc.length > 100
                          ? TextButton(
                              onPressed: () {
                                ref
                                    .watch(typeInfoStateProvider.notifier)
                                    .update((state) => TypeInfo.LIEU);
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MoreInfoWidget()),
                                );
                              },
                              child: const Text(
                                "Voir plus",
                                style: TextStyle(
                                    fontFamily: fontHindMaduraiRegular,
                                    fontSize: 12,
                                    color: coulCiel),
                              ),
                            )
                          : Container()
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton(
                        backgroundColor: coulBlack,
                        splashColor: coulRed,
                        onPressed: () {},
                        shape: const CircleBorder(
                          side: BorderSide(color: coulRed, width: 1),
                        ),
                        child: const Icon(
                          Icons.thumb_down_alt,
                          color: coulRed,
                          size: 30,
                        ),
                      ),
                      FloatingActionButton(
                        backgroundColor: coulBlack,
                        splashColor: coulCiel,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const MoreInfoWidget(),
                            ),
                          );
                        },
                        shape: const CircleBorder(
                          side: BorderSide(color: coulCiel, width: 1),
                        ),
                        child: const Icon(
                          Icons.remove_red_eye,
                          color: coulCiel,
                          size: 30,
                        ),
                      ),
                      FloatingActionButton(
                        backgroundColor: coulBlack,
                        splashColor: coulGreen,
                        onPressed: () {},
                        shape: const CircleBorder(
                          side: BorderSide(color: coulGreen, width: 1),
                        ),
                        child: const Icon(
                          Icons.thumb_up_alt,
                          color: coulGreen,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
