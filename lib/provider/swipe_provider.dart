import 'package:flutter_riverpod/flutter_riverpod.dart';

enum MoreInfoSwipe { VOIRPLUS, ALLTEXT }

final moreInfoSwipeProviderState =
    StateProvider<MoreInfoSwipe>((_) => MoreInfoSwipe.ALLTEXT);

final moreInfoProvider = Provider<MoreInfoSwipe>((ref) {
  final MoreInfoSwipe sortType = ref.watch(moreInfoSwipeProviderState);

  switch (sortType) {
    case MoreInfoSwipe.ALLTEXT:
      return MoreInfoSwipe.ALLTEXT;

    case MoreInfoSwipe.VOIRPLUS:
      return MoreInfoSwipe.VOIRPLUS;
  }
});
