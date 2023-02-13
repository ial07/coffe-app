import 'package:localstorage/localstorage.dart';

class SessionToken {
  static const key = "TOKEN";
  static LocalStorage storage = LocalStorage("NVO_API");

  static Future<void> store(String? token) async {
    await storage.setItem(key, token);
  }

  static Future<String?> read() async {
    return await storage.getItem(key);
  }
}
