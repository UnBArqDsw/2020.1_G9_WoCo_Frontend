import 'package:WoCo/models/authentication.dart';

abstract class Base {
  Future<Authentication> signUp(String email, String password);
  Future<Authentication> logIn(String email, String password);
}
