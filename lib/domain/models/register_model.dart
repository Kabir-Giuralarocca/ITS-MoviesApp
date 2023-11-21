class RegisterModel {
  final String username;
  final String email;
  final String password;

  RegisterModel({
    required this.username,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'password': password,
    };
  }
}
