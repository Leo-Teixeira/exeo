import 'package:exeo/screens/login.dart';
import 'package:exeo/services/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class ForgotPasswordPage extends ConsumerWidget {
  final GlobalKey<FormState> _loginKey = GlobalKey();
  FocusNode mail = FocusNode();
  FocusNode lastname = FocusNode();
  FocusNode firstname = FocusNode();
  final mailController = TextEditingController();
  final lastnameController = TextEditingController();
  final firstnameController = TextEditingController();

  ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Mot de passe oublié",
              style: TextStyle(fontFamily: fontRubikBold, fontSize: 28),
            ),
            const SizedBox(
              height: 44,
            ),
            Form(
              key: _loginKey,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      focusNode: mail,
                      onFieldSubmitted: (term) {
                        mail.unfocus();
                        FocusScope.of(context).requestFocus(lastname);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Le champ ne doit pas être vide';
                        }
                        return null;
                      },
                      controller: mailController,
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
                        labelText: "Votre adresse mail",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
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
                    height: 26,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      focusNode: firstname,
                      onFieldSubmitted: (term) {
                        firstname.unfocus();
                        FocusScope.of(context).requestFocus(mail);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Le champ ne doit pas être vide';
                        }
                        return null;
                      },
                      controller: firstnameController,
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
                        labelText: "Votre prénom",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                          const EdgeInsets.fromLTRB(2.25, 11.25, 2.25, 11.25),
                        ),
                      ),
                      child: const Text(
                        "Réinitialiser le mot de passe",
                        style: TextStyle(
                          color: coulBlack,
                          fontFamily: fontHindMaduraiMedium,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: const Text(
                      "Retour",
                      style: TextStyle(
                        color: coulCiel,
                        decoration: TextDecoration.underline,
                        fontFamily: fontHindMaduraiRegular,
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
