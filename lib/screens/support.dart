import 'package:exeo/services/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SupportWidget extends ConsumerWidget {
  const SupportWidget({super.key});

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
        child: Container(
          margin: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              titleSupport(context),
              Container(
                height: 1,
                color: coulBlack,
                child: const Divider(
                  color: coulBlack,
                  height: 0,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              formSupport(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget titleSupport(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back_ios),
      ),
      const Center(
        child: Text(
          "Support",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontFamily: fontRubikMedium),
        ),
      ),
      //! centrer le texte
    ],
  );
}

Widget formSupport() {
  TextEditingController subject = TextEditingController();
  TextEditingController body = TextEditingController();
  List<String> prob = ["J'ai trouvé un bug", "test1", "test2", "test3"];
  return Form(
    //! mettre la clé du formulaire pour pouvoir mettre les messages d'erreur
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Sujet de votre demande : ",
          style: TextStyle(fontSize: 16, fontFamily: fontHindMaduraiMedium),
        ),
        const SizedBox(
          height: 5,
        ),
        DropdownButton<String>(
          items: prob.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          hint: const Text(
            "J'ai trouvé un bug",
            style: TextStyle(fontFamily: fontHindMaduraiMedium, fontSize: 16),
          ),
          onChanged: (_) {},
          isExpanded: true,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Votre message : ",
          style: TextStyle(fontSize: 16, fontFamily: fontHindMaduraiMedium),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: subject,
          maxLines: null,
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Le champ ne doit pas être vide';
            }
            return null;
          },
          style: const TextStyle(
            fontFamily: fontHindMaduraiMedium,
            fontSize: 16,
          ),
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: coulGrey,
              ),
              // borderRadius: BorderRadius.circular(30.0),
            ),
            hintText: "PlaceHolder",
            hintStyle: TextStyle(
              fontFamily: fontHindMaduraiMedium,
              fontSize: 16,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: coulGrey,
              ),
              // borderRadius: BorderRadius.circular(30.0),
            ),
            labelStyle: TextStyle(
              color: coulGrey,
              fontFamily: fontHindMaduraiMedium,
              fontSize: 16,
            ),
            labelText: "Sujet du problème",
          ),
        ),
        const SizedBox(
          height: 20,
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
          ),
          child: const Text(
            "Envoyer",
            style: TextStyle(
              color: coulBlack,
              fontFamily: fontHindMaduraiMedium,
              fontSize: 16,
            ),
          ),
        ),
      ],
    ),
  );
}
