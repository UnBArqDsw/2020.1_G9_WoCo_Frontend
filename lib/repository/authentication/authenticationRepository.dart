import 'package:WoCo/models/authentication.dart';
import 'package:WoCo/services/authenticationApi.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthenticationRepository {
  AuthenticationApi api = AuthenticationApi();

  Future<Authentication> signUp(String email, String password) async {
    var response = await http.post(
      '${api.baseUrl}/api/register',
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = json.decode(response.body);

      return Authentication.fromJson(data);
    } else {
      throw Exception(
          {'status': response.statusCode, 'message': 'Wrong Reqres.in call'});
    }
  }
}
