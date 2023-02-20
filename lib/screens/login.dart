import 'package:exeo/services/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  final GlobalKey<FormState> _loginKey = GlobalKey();
  FocusNode identifiant = FocusNode();
  FocusNode password = FocusNode();
  final passwordController = TextEditingController();
  final identifiantController = TextEditingController();

  LoginPage({super.key});

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
                "Se Connecter",
                style: TextStyle(fontFamily: fontRubikBold, fontSize: 28),
              ),
              Form(
                key: _loginKey,
                child: AutofillGroup(
                  child: Column(
                    children: [
                      TextFormField(
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
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                              color: coulGrey,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          labelStyle: const TextStyle(
                            color: coulGrey,
                            fontFamily: fontHindMaduraiMedium,
                            fontSize: 16,
                          ),
                          labelText: "Email",
                        ),
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
