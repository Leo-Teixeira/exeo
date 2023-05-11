// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:exeo/provider/login_provider.dart';
import 'package:exeo/screens/login.dart';
import 'package:exeo/services/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:intl/intl.dart';

class InscriptionPage extends ConsumerWidget {
  final GlobalKey<FormState> _loginKey = GlobalKey();
  FocusNode lastname = FocusNode();
  FocusNode firstname = FocusNode();
  FocusNode birtdate = FocusNode();
  FocusNode email = FocusNode();
  FocusNode password = FocusNode();
  FocusNode confirmPassword = FocusNode();
  final lastnameController = TextEditingController();
  final firstnameController = TextEditingController();
  final birthdateController = MaskedTextController(mask: "0000-00-00");
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  InscriptionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ModePassword pwdShow = ref.watch(showHidePawdProviderState);
    return Scaffold(
      backgroundColor: coulBlack,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("./assets/pictures/real_background.png"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "S'enregistrer",
                  style: TextStyle(
                      fontFamily: fontRubikBold,
                      fontSize: 28,
                      color: coulWhite),
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
                              color: coulWhiteGrey),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: coulWhiteGrey,
                              ),
                              // borderRadius: BorderRadius.(),
                            ),
                            hintText: "PlaceHolder",
                            hintStyle: TextStyle(
                                fontFamily: fontHindMaduraiMedium,
                                fontSize: 16,
                                color: coulWhiteGrey),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: coulWhiteGrey,
                              ),
                              // borderRadius: BorderRadius.circular(30.0),
                            ),
                            labelStyle: TextStyle(
                              color: coulWhiteGrey,
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
                            FocusScope.of(context).requestFocus(birtdate);
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
                              color: coulWhiteGrey),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: coulWhiteGrey,
                              ),
                              // borderRadius: BorderRadius.(),
                            ),
                            hintText: "PlaceHolder",
                            hintStyle: TextStyle(
                                fontFamily: fontHindMaduraiMedium,
                                fontSize: 16,
                                color: coulWhiteGrey),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: coulWhiteGrey,
                              ),
                              // borderRadius: BorderRadius.circular(30.0),
                            ),
                            labelStyle: TextStyle(
                              color: coulWhiteGrey,
                              fontFamily: fontHindMaduraiMedium,
                              fontSize: 16,
                            ),
                            labelText: "Votre prénom",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: TextFormField(
                          keyboardType: TextInputType.datetime,
                          textInputAction: TextInputAction.next,
                          focusNode: birtdate,
                          onFieldSubmitted: (term) {
                            birtdate.unfocus();
                            FocusScope.of(context).requestFocus(email);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Le champ ne doit pas être vide';
                            }
                            return null;
                          },
                          controller: birthdateController,
                          style: const TextStyle(
                              fontFamily: fontHindMaduraiMedium,
                              fontSize: 16,
                              color: coulWhiteGrey),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: coulWhiteGrey,
                              ),
                              // borderRadius: BorderRadius.(),
                            ),
                            hintText: "PlaceHolder",
                            hintStyle: TextStyle(
                              fontFamily: fontHindMaduraiMedium,
                              fontSize: 16,
                            ),
                            suffixIcon: Icon(
                              FontAwesome5.calendar_alt,
                              color: coulWhiteGrey,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: coulWhiteGrey,
                              ),
                              // borderRadius: BorderRadius.circular(30.0),
                            ),
                            labelStyle: TextStyle(
                              color: coulWhiteGrey,
                              fontFamily: fontHindMaduraiMedium,
                              fontSize: 16,
                            ),
                            labelText: "Votre date de naissance",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          focusNode: email,
                          onFieldSubmitted: (term) {
                            email.unfocus();
                            FocusScope.of(context).requestFocus(password);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Le champ ne doit pas être vide';
                            }
                            return null;
                          },
                          controller: emailController,
                          style: const TextStyle(
                              fontFamily: fontHindMaduraiMedium,
                              fontSize: 16,
                              color: coulWhiteGrey),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: coulWhiteGrey,
                              ),
                              // borderRadius: BorderRadius.(),
                            ),
                            hintText: "PlaceHolder",
                            hintStyle: TextStyle(
                                fontFamily: fontHindMaduraiMedium,
                                fontSize: 16,
                                color: coulWhiteGrey),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: coulWhiteGrey,
                              ),
                              // borderRadius: BorderRadius.circular(30.0),
                            ),
                            labelStyle: TextStyle(
                              color: coulWhiteGrey,
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
                          obscureText: true,
                          textInputAction: TextInputAction.next,
                          focusNode: password,
                          onFieldSubmitted: (term) {
                            password.unfocus();
                            FocusScope.of(context)
                                .requestFocus(confirmPassword);
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
                              color: coulWhiteGrey),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: coulWhiteGrey,
                              ),
                              // borderRadius: BorderRadius.circular(30.0),
                            ),
                            hintText: "PlaceHolder",
                            hintStyle: const TextStyle(
                                fontFamily: fontHindMaduraiMedium,
                                fontSize: 16,
                                color: coulWhiteGrey),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  if (pwdShow == ModePassword.SHOW) {
                                    ref
                                        .watch(
                                            showHidePawdProviderState.notifier)
                                        .update((state) => ModePassword.HIDE);
                                  } else {
                                    ref
                                        .watch(
                                            showHidePawdProviderState.notifier)
                                        .update((state) => ModePassword.SHOW);
                                  }
                                },
                                icon: Icon(
                                  pwdShow == ModePassword.SHOW
                                      ? Icons.remove_red_eye_outlined
                                      : FontAwesome5.eye_slash,
                                  color: coulWhiteGrey,
                                )),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: coulWhiteGrey,
                              ),
                              // borderRadius: BorderRadius.circular(30.0),
                            ),
                            labelStyle: const TextStyle(
                              color: coulWhiteGrey,
                              fontFamily: fontHindMaduraiMedium,
                              fontSize: 16,
                            ),
                            labelText: "Entrer votre mot de passe",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: TextFormField(
                          obscureText: true,
                          textInputAction: TextInputAction.next,
                          focusNode: confirmPassword,
                          onFieldSubmitted: (term) {
                            confirmPassword.unfocus();
                            FocusScope.of(context).requestFocus(lastname);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Le champ ne doit pas être vide';
                            }
                            return null;
                          },
                          controller: confirmController,
                          style: const TextStyle(
                              fontFamily: fontHindMaduraiMedium,
                              fontSize: 16,
                              color: coulWhiteGrey),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: coulWhiteGrey,
                              ),
                              // borderRadius: BorderRadius.circular(30.0),
                            ),
                            hintText: "PlaceHolder",
                            hintStyle: const TextStyle(
                                fontFamily: fontHindMaduraiMedium,
                                fontSize: 16,
                                color: coulWhiteGrey),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  if (pwdShow == ModePassword.SHOW) {
                                    ref
                                        .watch(
                                            showHidePawdProviderState.notifier)
                                        .update((state) => ModePassword.HIDE);
                                  } else {
                                    ref
                                        .watch(
                                            showHidePawdProviderState.notifier)
                                        .update((state) => ModePassword.SHOW);
                                  }
                                },
                                icon: Icon(
                                  pwdShow == ModePassword.SHOW
                                      ? Icons.remove_red_eye_outlined
                                      : FontAwesome5.eye_slash,
                                  color: coulWhiteGrey,
                                )),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: coulWhiteGrey,
                              ),
                              // borderRadius: BorderRadius.circular(30.0),
                            ),
                            labelStyle: const TextStyle(
                              color: coulWhiteGrey,
                              fontFamily: fontHindMaduraiMedium,
                              fontSize: 16,
                            ),
                            labelText: "Confirmer votre mot de passe",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: OutlinedButton(
                          onPressed: () async {
                            var bytes = utf8.encode(passwordController
                                .text); // Convertit la chaîne en bytes UTF-8
                            String digest = sha256.convert(bytes).toString();
                            await ref.watch(registerUser(jsonEncode({
                              "email": emailController.text,
                              "password": digest,
                              "firstname": firstnameController.text,
                              "lastname": lastnameController.text,
                              "birth_date": birthdateController.text,
                              "lng": 0,
                              "lat": 0
                            })).future);
                            Navigator.of(context).pop();
                          },
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
                            "Inscription",
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
                                color: coulWhite),
                          ),
                          TextButton(
                            onPressed: () {
                              ref.refresh(showHidePawdProviderState);
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: const Text(
                              "Connectez-vous",
                              style: TextStyle(
                                color: coulCiel,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
