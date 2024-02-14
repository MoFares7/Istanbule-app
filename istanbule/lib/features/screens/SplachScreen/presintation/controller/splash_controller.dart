import 'package:get/get.dart';
import 'package:istanbule/features/pages/presintation/page_view_screen.dart';

import '../../../../../../core/routing/routing_manager.dart';
import '../../../../../../core/storage/storage.dart';

class SplashController extends GetxController {
  LocalStorage storage = LocalStorage();

  Future<void> checkToken() async {
    String? token = storage.getToken();

    if (token != null) {
      Get.to(PageViewScreen());
    } else {
      Get.to(PageViewScreen());
    }
  }
}
