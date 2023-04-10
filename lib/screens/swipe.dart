import 'package:exeo/services/constant.dart';
import 'package:exeo/services/test.dart';
import 'package:exeo/screens/cardSwipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SwipeWidget extends ConsumerStatefulWidget {
  const SwipeWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<SwipeWidget> createState() => SwipeWidgetState();
}

class SwipeWidgetState extends ConsumerState<SwipeWidget> {
  final CardSwiperController controller = CardSwiperController();

  final cards =
      candidates.map((candidate) => SwipeCardWidget(candidate)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarReception(context),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: CardSwiper(
                
                isLoop: true,
                controller: controller,
                cardsCount: cards.length,
                numberOfCardsDisplayed: 3,
                onSwipe: _onSwipe,
                onUndo: _onUndo,
                padding: const EdgeInsets.all(24.0),
                cardBuilder: (context, index) => cards[index],
                isVerticalSwipingEnabled: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }
}