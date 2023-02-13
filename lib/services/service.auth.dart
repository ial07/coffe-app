import 'package:driver/services/models.dart';
import 'package:driver/services/utils/rest.dart';
import 'package:driver/services/utils/storage.dart';

import 'response/response.dart';
import 'request/auth.signin.dart';

abstract class AuthService {
  static Future<ServiceResponse> signin(SigninRequest data) async {
    final rest = Rest(Session.fromResponse);
    final response = await rest.post("auth/signin", data.toJson());

    // if successed login, we store the token
    // for authentication session of this current user on next call
    if (!response.isError) {
      SessionToken.store(response.data.token);
    }

    return response;
  }

  static Future<ServiceResponse> session() async {
    final rest = Rest(null);
    final response = await rest.get("auth/me", null);

    // we need to re-store the token
    // if the token has been changed on the server
    if (!response.isError) {
      SessionToken.store(response.data.token);
    }

    return response;
  }
}
