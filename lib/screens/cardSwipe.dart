import 'package:exeo/provider/swipe_provider.dart';
import 'package:exeo/screens/more_info.dart';
import 'package:exeo/services/constant.dart';
import 'package:exeo/services/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SwipeCardWidget extends ConsumerWidget {
  final ExampleCandidateModel candidate;

  const SwipeCardWidget(
    this.candidate, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MoreInfoSwipe voirPlus = ref.watch(moreInfoSwipeProviderState);
    String desc =
        "Lorem ipsum dolor sit amet consectetur. Pretium augue at vel mattis rhoncus eros ultricies. Aliquet aliquam ut gravida sociis porttitor suscipit viverra morbi ultrices. Mauris vitae id lacus velit integer placerat quis gravida euismod. At tempus vel urna vitae congue a nisl. Amet maecenas vel porttitor eros amet. Quis est a sit lorem lectus. Euismod et lacus facilisis turpis proin. Enim tristique nunc enim arcu purus risus augue. Tellus diam lorem eget ut pharetra eu.Quisque mi ipsum massa natoque sit dolor. Facilisi adipiscing morbi id amet mattis sed at magnis. Varius arcu integer molestie suspendisse nibh diam. Faucibus iaculis ut netus dapibus nisi nunc. Justo at eros nisl aliquam at sapien vitae. Tincidunt proin aliquet urna rutrum odio diam est cursus. Quis viverra proin mi gravida. Eget faucibus pellentesque non eget pharetra lorem nunc. Vitae scelerisque at vitae eleifend nullam tempus sapien. Faucibus semper ipsum velit ullamcorper commodo tristique. Urna senectus arcu neque vitae et non.";
    if (desc.length > 100) {
      ref
          .watch(moreInfoSwipeProviderState.notifier)
          .update((state) => MoreInfoSwipe.VOIRPLUS);
    }
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const MoreInfoWidget(),
          ),
        );
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
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
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: candidate.color,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    candidate.name,
                    style: const TextStyle(
                      color: coulBlack,
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
                                  side: BorderSide(width: 1),
                                ),
                              ),
                            ),
                            child: Text(
                              candidate.job,
                              style: const TextStyle(
                                  fontFamily: fontHindMaduraiMedium,
                                  fontSize: 16,
                                  color: coulBlack),
                            ),
                          ),
                      ],
                    ),
                  const SizedBox(height: 10),
                  //! faire un voir plus pour cette partie car description trop longue
                  Column(
                    children: [
                      Text(
                        voirPlus == MoreInfoSwipe.ALLTEXT
                            ? desc
                            : "${desc.substring(0, 100)}...",
                        style: const TextStyle(
                            color: coulBlack,
                            fontFamily: fontHindMaduraiRegular,
                            fontSize: 16),
                      ),
                      voirPlus == MoreInfoSwipe.VOIRPLUS
                          ? TextButton(
                              onPressed: () {
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
                                    fontSize: 12),
                              ),
                            )
                          : Container()
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton(
                        backgroundColor: coulWhite,
                        splashColor: Colors.red,
                        onPressed: () {},
                        child: const Icon(
                          Icons.thumb_down_alt,
                          color: Colors.red,
                          size: 50,
                        ),
                      ),
                      FloatingActionButton(
                        backgroundColor: coulWhite,
                        splashColor: coulCiel,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const MoreInfoWidget(),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.remove_red_eye,
                          color: coulCiel,
                          size: 50,
                        ),
                      ),
                      FloatingActionButton(
                        backgroundColor: coulWhite,
                        splashColor: Colors.green,
                        onPressed: () {},
                        child: const Icon(
                          Icons.thumb_up_alt,
                          color: Colors.green,
                          size: 50,
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
