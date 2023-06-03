import 'package:exeo/screens/cardSwipe.dart';
import 'package:flutter/material.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:exeo/services/constant.dart';
import 'package:exeo/services/test.dart';

class SwipeWidget extends StatefulWidget {
  const SwipeWidget({Key? key}) : super(key: key);

  @override
  _SwipeWidgetState createState() => _SwipeWidgetState();
}

class _SwipeWidgetState extends State<SwipeWidget> {
  final AppinioSwiperController controller = AppinioSwiperController();

  final List<Widget> cards =
      candidates.map((candidate) => SwipeCardWidget(candidate)).toList();

  @override
  Widget build(BuildContext context) {
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
        child: SafeArea(
          child: Column(
            children: [
              Flexible(
                child: AppinioSwiper(
                  controller: controller,
                  cardsCount: cards.length,
                  cardsBuilder: (context, index) => cards[index],
                  onSwipe: (int index, AppinioSwiperDirection position) {
                    debugPrint(
                      'The card at index $index was swiped to $position',
                    );
                  },
                  swipeOptions: AppinioSwipeOptions.horizontal,
                  // onRewind: (int index, SwiperPosition position) {
                  //   debugPrint(
                  //     'The card at index $index was rewound from $position',
                  //   );
                  // },
                  // swipeConfiguration: SwipeConfiguration(
                  //   verticalSwipeBehavior: SwipeBehavior.forbid,
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
