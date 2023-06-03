import 'dart:ui';

import 'package:exeo/models/event_model.dart';
import 'package:exeo/provider/reception_provider.dart';
import 'package:exeo/screens/cardSwipe.dart';
import 'package:flutter/material.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:exeo/services/constant.dart';
import 'package:exeo/services/test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SwipeWidget extends ConsumerStatefulWidget {
  const SwipeWidget({Key? key}) : super(key: key);

  @override
  _SwipeWidgetState createState() => _SwipeWidgetState();
}

class _SwipeWidgetState extends ConsumerState<SwipeWidget> {
  final AppinioSwiperController controller = AppinioSwiperController();
  bool isAllCardsSwiped = false;

  @override
  Widget build(BuildContext context) {
    AsyncValue<List<Events>> listEvent = ref.watch(getEvenementsLimit(20));
    return Scaffold(
      backgroundColor: coulBlack,
      appBar: appBarReception(context),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("./assets/pictures/real_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: listEvent.when(
          data: (events) {
            if (events.isEmpty) {
              isAllCardsSwiped = true;
            }
            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: AppinioSwiper(
                      controller: controller,
                      cardsCount: events.length,
                      cardsBuilder: (context, index) =>
                          SwipeCardWidget(events[index]),
                      onSwipe: (int index, AppinioSwiperDirection position) {
                        debugPrint(
                          'The card at index $index was swiped to $position',
                        );
                        if (index == events.length) {
                          setState(() {
                            isAllCardsSwiped = true;
                          });
                        }
                      },
                      swipeOptions: AppinioSwipeOptions.horizontal,
                    ),
                  ),
                  if (isAllCardsSwiped) ...[
                    BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 3,
                        sigmaY: 3,
                      ),
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.all(30),
                        color: Colors.white,
                        child: const Text(
                          "Vous devez disposer d'un abonnement premium pour avoir accès à plus de swipe",
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            );
          },
          error: (err, stack) {
            return const Center(child: CircularProgressIndicator());
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
