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
                  const Text(
                    "Lorem ipsum dolor sit amet consectetur. In pellentesque pharetra tincidunt neque vulputate dignissim at. Scelerisque cras quis dictum tellus mi consectetur. Fringilla id adipiscing turpis convallis rutrum pellentesque amet tincidunt. ",
                    style: TextStyle(
                        color: coulBlack,
                        fontFamily: fontHindMaduraiRegular,
                        fontSize: 16),
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
