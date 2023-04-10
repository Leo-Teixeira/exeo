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
            titlePage(),
            bodyPage(),
          ],
        ),
      ),
    );
  }
}

Widget titlePage() {
  return Row(
    children: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.arrow_back_ios),
      ),
      const Text("Retour"),
    ],
  );
}

Widget bodyPage() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.all(15),
        child: Image.asset("assets/pictures/bar_chat.png"),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: const Text("Nom Lieu")),
          Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: RatingBar.builder(
              itemSize: 20,
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
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
          ),
        ],
      ),
      const SizedBox(
        height: 12,
      ),
      Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: const Text("Nom Evenement")),
      const SizedBox(
        height: 12,
      ),
      Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: const Text(
              "Ces personnes suivent l'evenement (mettre les avatars)")),
      const SizedBox(
        height: 12,
      ),
      Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child:
              const Text("Ces amis suivent cette evenement (mettre avatars)")),
      const SizedBox(
        height: 12,
      ),
      Container(
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: OutlinedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color?>(coulCiel),
            minimumSize: MaterialStateProperty.all<Size?>(
              const Size(500.0, 40.0),
            ),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
              const EdgeInsets.fromLTRB(2.25, 11.25, 2.25, 11.25),
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
      ),
      const SizedBox(
        height: 12,
      ),
      Container(
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: OutlinedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color?>(coulCiel),
            minimumSize: MaterialStateProperty.all<Size?>(
              const Size(500.0, 40.0),
            ),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
              const EdgeInsets.fromLTRB(2.25, 11.25, 2.25, 11.25),
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
      ),
      const SizedBox(
        height: 12,
      ),
      Container(
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: const Text(
            "Lorem ipsum dolor sit amet consectetur. Pretium augue at vel mattis rhoncus eros ultricies. Aliquet aliquam ut gravida sociis porttitor suscipit viverra morbi ultrices. Mauris vitae id lacus velit integer placerat quis gravida euismod. At tempus vel urna vitae congue a nisl. Amet maecenas vel porttitor eros amet. Quis est a sit lorem lectus. Euismod et lacus facilisis turpis proin. Enim tristique nunc enim arcu purus risus augue. Tellus diam lorem eget ut pharetra eu.Quisque mi ipsum massa natoque sit dolor. Facilisi adipiscing morbi id amet mattis sed at magnis. Varius arcu integer molestie suspendisse nibh diam. Faucibus iaculis ut netus dapibus nisi nunc. Justo at eros nisl aliquam at sapien vitae. Tincidunt proin aliquet urna rutrum odio diam est cursus. Quis viverra proin mi gravida. Eget faucibus pellentesque non eget pharetra lorem nunc. Vitae scelerisque at vitae eleifend nullam tempus sapien. Faucibus semper ipsum velit ullamcorper commodo tristique. Urna senectus arcu neque vitae et non."),
      )
    ],
  );
}
