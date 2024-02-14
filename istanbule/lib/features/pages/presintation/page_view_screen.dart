import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:istanbule/features/pages/widget/sideView.dart';
import 'package:istanbule/features/screens/AuthScreen/presintation/pages/loginScreen.dart';

import '../../Utils/them.dart';
import '../widget/nextSlideButton.dart';
import '../widget/slideIndicator.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({Key? key}) : super(key: key);

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  PageController? _pageController;

  onClickNext() {
    if (_pageController!.hasClients) {
      if (_pageController!.page! < 2) {
        _pageController!.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.bounceInOut);
      } else {
        if (_pageController!.page! == 2) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        }
      }
    }
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primary1,
      body: SafeArea(
        child: Align(
          child: Stack(
            children: [
              SlideView(controller: _pageController!),
              Positioned(
                  bottom: 80,
                  right: 10,
                  left: 10,
                  child: SlideIndicator(
                    dotIndex:
                        _pageController!.hasClients ? _pageController!.page! : 0,
                  )),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: NextSlideButton(
                    onClickNext: () {
                      onClickNext();
                    },
                    width: 250,
                    titleButton: _pageController!.hasClients
                        ? _pageController!.page != 2
                            ? 'Next'.tr
                            : 'Get Started'.tr
                        : 'Next'.tr,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
