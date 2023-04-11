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
      appBar: appBarReception(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            titlePage(context),
            const SizedBox(
              height: 24,
            ),
            bodyPage(),
          ],
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
        icon: const Icon(Icons.arrow_back_ios),
      ),
      const Text(
        "Retour",
        style: TextStyle(fontFamily: fontHindMaduraiLight, fontSize: 16),
      ),
    ],
  );
}

Widget bodyPage() {
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
              style: TextStyle(fontFamily: fontRubikMedium, fontSize: 20),
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
          style: TextStyle(fontFamily: fontRubikMedium, fontSize: 16),
        ),
        const SizedBox(
          height: 8,
        ),
        //!mettre un listView builder pour afficher tous les avatar en plus
        Row(
          children: [
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
              style:
                  TextStyle(fontFamily: fontHindMaduraiRegular, fontSize: 12),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: const [
            Text(
              "JaneDoe et Carlos suivent l'évènement",
              style:
                  TextStyle(fontFamily: fontHindMaduraiRegular, fontSize: 12),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        OutlinedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color?>(coulCiel),
            minimumSize: MaterialStateProperty.all<Size?>(
              const Size(500.0, 40.0),
            ),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
              const EdgeInsets.fromLTRB(2.25, 11.25, 2.25, 11.25),
            ),
            shape: MaterialStateProperty.all<OutlinedBorder?>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Enregistrer l'évènement",
                style: TextStyle(
                  color: coulBlack,
                  fontFamily: fontHindMaduraiMedium,
                  fontSize: 16,
                ),
              ),
              Icon(Icons.bookmark_add)
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        OutlinedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color?>(coulCiel),
            minimumSize: MaterialStateProperty.all<Size?>(
              const Size(500.0, 40.0),
            ),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
              const EdgeInsets.fromLTRB(2.25, 11.25, 2.25, 11.25),
            ),
            shape: MaterialStateProperty.all<OutlinedBorder?>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          child: const Text(
            "Participer",
            style: TextStyle(
              color: coulBlack,
              fontFamily: fontHindMaduraiMedium,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        const Text(
          "Lorem ipsum dolor sit amet consectetur. Pretium augue at vel mattis rhoncus eros ultricies. Aliquet aliquam ut gravida sociis porttitor suscipit viverra morbi ultrices. Mauris vitae id lacus velit integer placerat quis gravida euismod. At tempus vel urna vitae congue a nisl. Amet maecenas vel porttitor eros amet. Quis est a sit lorem lectus. Euismod et lacus facilisis turpis proin. Enim tristique nunc enim arcu purus risus augue. Tellus diam lorem eget ut pharetra eu.Quisque mi ipsum massa natoque sit dolor. Facilisi adipiscing morbi id amet mattis sed at magnis. Varius arcu integer molestie suspendisse nibh diam. Faucibus iaculis ut netus dapibus nisi nunc. Justo at eros nisl aliquam at sapien vitae. Tincidunt proin aliquet urna rutrum odio diam est cursus. Quis viverra proin mi gravida. Eget faucibus pellentesque non eget pharetra lorem nunc. Vitae scelerisque at vitae eleifend nullam tempus sapien. Faucibus semper ipsum velit ullamcorper commodo tristique. Urna senectus arcu neque vitae et non.",
          style: TextStyle(fontFamily: fontHindMaduraiMedium, fontSize: 16),
        )
      ],
    ),
  );
}
