class SigninRequest {
  String username;
  String password;
  String app;

  SigninRequest({
    required this.username,
    required this.password,
    required this.app,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "app": app,
      };
}
