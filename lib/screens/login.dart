import 'package:exeo/provider/login_provider.dart';
import 'package:exeo/screens/forgot_password.dart';
import 'package:exeo/screens/inscription.dart';
import 'package:exeo/services/bottom_appbar.dart';
import 'package:exeo/services/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class LoginWidget extends ConsumerWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

// ignore: must_be_immutable
class LoginPage extends ConsumerWidget {
  final GlobalKey<FormState> _loginKey = GlobalKey();
  FocusNode identifiant = FocusNode();
  FocusNode password = FocusNode();
  final passwordController = TextEditingController();
  final identifiantController = TextEditingController();

  LoginPage({super.key});

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Se Connecter",
                style: TextStyle(
                    fontFamily: fontRubikBold, fontSize: 28, color: coulWhite),
              ),
              const SizedBox(
                height: 44,
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
                          focusNode: identifiant,
                          onFieldSubmitted: (term) {
                            identifiant.unfocus();
                            FocusScope.of(context).requestFocus(password);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Le champ ne doit pas être vide';
                            }
                            return null;
                          },
                          controller: identifiantController,
                          style: const TextStyle(
                            fontFamily: fontHindMaduraiMedium,
                            fontSize: 16,
                          ),
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
                            labelText: "Votre identifiant",
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
                              focusNode: password,
                              obscureText:
                                  pwdShow == ModePassword.HIDE ? true : false,
                              onFieldSubmitted: (term) {
                                identifiant.unfocus();
                                FocusScope.of(context).requestFocus(password);
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
                                            .watch(showHidePawdProviderState
                                                .notifier)
                                            .update(
                                                (state) => ModePassword.HIDE);
                                      } else {
                                        ref
                                            .watch(showHidePawdProviderState
                                                .notifier)
                                            .update(
                                                (state) => ModePassword.SHOW);
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
                                labelText: "Votre mot de passe",
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(15, 0, 20, 0),
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        ForgotPasswordPage()));
                              },
                              child: const Text(
                                "Mot de passe oublié ?",
                                style: TextStyle(
                                    color: coulWhite,
                                    decoration: TextDecoration.underline,
                                    fontFamily: fontHindMaduraiRegular,
                                    fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const NavBarPage()));
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
                            "Vous n'avez pas de compte ?",
                            style: TextStyle(
                              color: coulWhite,
                              fontFamily: fontHindMaduraiRegular,
                              fontSize: 12,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              ref.refresh(showHidePawdProviderState);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => InscriptionPage()));
                            },
                            child: const Text(
                              "Inscrivez-vous",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
