import 'dart:io';

import 'package:exeo/provider/login_provider.dart';
import 'package:exeo/screens/login.dart';
import 'package:exeo/screens/reception.dart';
import 'package:exeo/services/bottom_appbar.dart';
import 'package:exeo/services/design_patterns.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SingletonSharedPreferences.getInstance();
  if (prefs.containsKey("email") == true &&
      prefs.containsKey("password") == true) {
    bool result = await connection({
      "email": prefs.getString("email").toString(),
      "password": prefs.getString("password").toString()
    });
    if (result == true) {
      runApp(const ProviderScope(child: NavBarPage()));
    } else {
      runApp(const ProviderScope(child: LoginWidget()));
    }
  } else {
    runApp(const ProviderScope(child: LoginWidget()));
  }
}
