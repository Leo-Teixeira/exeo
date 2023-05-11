import 'dart:convert';
import 'dart:ffi';
import 'dart:math';
import 'package:exeo/models/user_model.dart';
import 'package:exeo/services/constant.dart';
import 'package:http/http.dart' as http;

class LoginController {
  Future<bool> registerUser(String infoRegister) async {
    final apiUrl = Uri.parse("${urlApi}register");
    final response = await http.post(apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: infoRegister);
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      print(json);
      var res = json['data'];

      // final User infoContactSociete = User.fromMap(res);
      return true;
    } else {
      throw Exception('failed to login');
    }
  }

  Future<User> loginUser(String infoRegister) async {
    final apiUrl = Uri.parse("${urlApi}connection");
    final response = await http.post(apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: infoRegister);
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      var res = json["data"];
      print(res);
      if (res != null) {
        final User infoContactSociete = User.fromMap(res);
        return infoContactSociete;
      } else {
        throw Exception('failed to login');
      }
    } else {
      throw Exception('failed to login');
    }
  }
}
