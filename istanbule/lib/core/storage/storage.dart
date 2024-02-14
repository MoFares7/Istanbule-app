import 'package:get_storage/get_storage.dart';

class LocalStorage {
  final GetStorage storage = GetStorage();

  Future<void> saveToken(String token) async {
    await storage.write("access_token", token);
  }

  String? getToken() {
    return storage.read("access_token");
  }

  Future<void> clearCache() async {
    await storage.erase();
  }
}
