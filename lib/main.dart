import 'package:flutter/material.dart';
import 'package:istanbule/core/routing/routing_manager.dart';
import 'package:istanbule/views/Utils/them.dart';
import 'package:istanbule/views/screens/AuthScreen/presintation/loginScreen.dart';
import 'package:istanbule/views/screens/AuthScreen/presintation/registerScreen.dart';
import 'package:istanbule/views/screens/MainScreen/mainScreen.dart';
import 'package:istanbule/views/screens/SplachScreen/splachSscreen.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:get/get.dart';

void main() {
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
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      //getPages: RoutingManager.pages,
      //initialRoute: RoutesName.splashScreen,
      home: MainScreen(),
    );
  }
}
