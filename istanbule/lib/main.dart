import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:istanbule/core/translate/app_translate.dart';
import 'package:istanbule/features/Utils/them.dart';
import 'package:istanbule/features/screens/AuthScreen/presintation/pages/loginScreen.dart';
import 'package:istanbule/features/screens/AuthScreen/presintation/pages/registerScreen.dart';
import 'package:istanbule/features/screens/MainScreen/mainScreen.dart';
import 'package:istanbule/features/screens/SplachScreen/presintation/pages/splachSscreen.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:get/get.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.primary1,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Istanbul App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      builder: (context, child) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, child!),
        breakpoints: [
          const ResponsiveBreakpoint.autoScale(450, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(650, name: TABLET),
          const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(2468, name: '4K'),
        ],
      ),
      translations: AppTranslations(),
      fallbackLocale: const Locale('en'),
      locale: const Locale('ru'),
      //getPages: RoutingManager.pages,
      //initialRoute: RoutesName.splashScreen,
      home: MainScreen(),
    );
  }
}
