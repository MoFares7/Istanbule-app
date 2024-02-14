import 'package:get/get.dart';
import 'package:istanbule/features/screens/SplachScreen/presintation/pages/splachSscreen.dart';


class RoutesName {
  //! Auth Route
  static String splashScreen = '/splash-screen';
  static String login = '/login';
  static String register = '/register';
  static String editProfile = '/edit-profile';
  static String otpVerifiction = '/otp-verification';

  //! MainScreen Route
  static String mainScreen = '/main-screen';
  static String homeScreen = '/home-screen';
  static String centerScreen = '/center-screen';
  static String rateScreen = '/rate-screen';
  static String settingScreen = '/setting-screen';
  static String accountScreen = '/account-screen';

  //! Managament Center
  static String centerDetails = '/center-details';
  static String aboutCenterScreen = '/about-center-screen';
  static String myRateingScreen = '/my-Rateing-Screen';

  //! Managament Appointnemt
  static String myBookingsScreen = '/myBookings-screen';
  static String managamentBookingsScreen = '/managamentBookings-screen';
  static String aboutBookingsScreen = '/about-Bookings-screen';

  //! Managament Volunteer
  static String myVolunteerScreen = '/myVolunteer-screen';
  static String mainVolunteerScreen = '/mainVolunteer-screen';
  static String aboutVolunteerScreen = '/aboutVolunteer-screen';
}

class RoutingManager {
  static List<GetPage<dynamic>> pages = [
    GetPage(
      name: RoutesName.splashScreen,
      page: () => SplashScreen(),
    ),

  ];

  static void off(String route) {
    Get.offNamed(route);
  }

  static void offAll(String route) {
    Get.offAllNamed(route);
  }

  static void to(String route, {dynamic arguments}) {
    Get.toNamed(route, arguments: arguments);
  }

  static void back() {
    Get.back();
  }
}
