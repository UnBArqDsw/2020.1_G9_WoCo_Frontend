class Authentication {
  String email;
  String password;
  int id;
  String token;

  Authentication({this.email, this.password, this.id, this.token});

  Authentication.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    id = json['id'];
    token = json['token'];
  }
}
