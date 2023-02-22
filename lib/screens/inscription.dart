import 'package:exeo/services/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class InscriptionPage extends ConsumerWidget {
  final GlobalKey<FormState> _loginKey = GlobalKey();
  FocusNode lastname = FocusNode();
  FocusNode firstname = FocusNode();
  FocusNode birtdate = FocusNode();
  FocusNode mail = FocusNode();
  FocusNode password = FocusNode();
  FocusNode confirmPassword = FocusNode();
  final lastnameController = TextEditingController();
  final firstnameController = TextEditingController();
  final birthdateController = TextEditingController();
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  InscriptionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "S'enregistrer",
                style: TextStyle(fontFamily: fontRubikBold, fontSize: 28),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _loginKey,
                child: AutofillGroup(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: TextFormField(
                          // autofillHints: const [AutofillHints.email],
                          textInputAction: TextInputAction.next,
                          focusNode: lastname,
                          onFieldSubmitted: (term) {
                            lastname.unfocus();
                            FocusScope.of(context).requestFocus(firstname);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Le champ ne doit pas être vide';
                            }
                            return null;
                          },
                          controller: lastnameController,
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
                              // borderRadius: BorderRadius.(),
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
                            labelText: "Votre nom",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: TextFormField(
                              // autofillHints: const [AutofillHints.email],
                              textInputAction: TextInputAction.next,
                              focusNode: firstname,
                              onFieldSubmitted: (term) {
                                firstname.unfocus();
                                FocusScope.of(context).requestFocus(birtdate);
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Le champ ne doit pas être vide';
                                }
                                return null;
                              },
                              controller: passwordController,
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
                                suffixIcon: Icon(
                                  FontAwesome5.eye,
                                  color: coulBlack,
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
                                labelText: "Votre prénom",
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: OutlinedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color?>(coulCiel),
                            minimumSize: MaterialStateProperty.all<Size?>(
                              const Size(500.0, 40.0),
                            ),
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry?>(
                              const EdgeInsets.fromLTRB(
                                  2.25, 11.25, 2.25, 11.25),
                            ),
                          ),
                          child: const Text(
                            "Connexion",
                            style: TextStyle(
                              color: coulBlack,
                              fontFamily: fontHindMaduraiMedium,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Vous avez déja un compte ?",
                            style: TextStyle(
                              fontFamily: fontHindMaduraiRegular,
                              fontSize: 12,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Connectez-vous",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontFamily: fontHindMaduraiRegular,
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
