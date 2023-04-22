import 'package:exeo/provider/reception_provider.dart';
import 'package:exeo/screens/more_user.dart';
import 'package:exeo/services/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoreInfoWidget extends ConsumerWidget {
  const MoreInfoWidget({super.key});

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
              bodyPage(ref, context),
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

Widget bodyPage(WidgetRef ref, BuildContext context) {
  TypeInfo type = ref.watch(typeInfoStateProvider);
  return Container(
    margin: const EdgeInsets.only(left: 15, right: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset("assets/pictures/bar_chat.png"),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Nom Lieu",
              style: TextStyle(
                  fontFamily: fontRubikMedium, fontSize: 20, color: coulWhite),
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
        const Text(
          "Nom Evenement",
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
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder?>(
                RoundedRectangleBorder(
                    side: BorderSide(
                      color: type == TypeInfo.EVENEMENT ? coulCiel : coulGreen,
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
                    ? "Enregistrer l'évènement"
                    : "Sauvegarder",
                style: TextStyle(
                  color: type == TypeInfo.EVENEMENT ? coulCiel : coulBlack,
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
        ),
        const SizedBox(
          height: 12,
        ),
        ElevatedButton(
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
        ),
        const SizedBox(
          height: 24,
        ),
        const Text(
          "Lorem ipsum dolor sit amet consectetur. Pretium augue at vel mattis rhoncus eros ultricies. Aliquet aliquam ut gravida sociis porttitor suscipit viverra morbi ultrices. Mauris vitae id lacus velit integer placerat quis gravida euismod. At tempus vel urna vitae congue a nisl. Amet maecenas vel porttitor eros amet. Quis est a sit lorem lectus. Euismod et lacus facilisis turpis proin. Enim tristique nunc enim arcu purus risus augue. Tellus diam lorem eget ut pharetra eu.Quisque mi ipsum massa natoque sit dolor. Facilisi adipiscing morbi id amet mattis sed at magnis. Varius arcu integer molestie suspendisse nibh diam. Faucibus iaculis ut netus dapibus nisi nunc. Justo at eros nisl aliquam at sapien vitae. Tincidunt proin aliquet urna rutrum odio diam est cursus. Quis viverra proin mi gravida. Eget faucibus pellentesque non eget pharetra lorem nunc. Vitae scelerisque at vitae eleifend nullam tempus sapien. Faucibus semper ipsum velit ullamcorper commodo tristique. Urna senectus arcu neque vitae et non.",
          style: TextStyle(
            fontFamily: fontHindMaduraiMedium,
            fontSize: 16,
            color: coulWhite,
          ),
        )
      ],
    ),
  );
}
