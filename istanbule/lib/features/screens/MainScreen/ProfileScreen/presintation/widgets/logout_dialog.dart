import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:istanbule/core/storage/storage.dart';
import 'package:istanbule/features/Utils/styled.dart';
import 'package:istanbule/features/Utils/them.dart';
import 'package:istanbule/features/screens/AuthScreen/presintation/pages/loginScreen.dart';

class LogoutDialog extends StatelessWidget {
  LogoutDialog({super.key});

  LocalStorage localStorage = LocalStorage();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.cardLight,
      title: Text(
        ('logout'),
        style: Theme.of(context).textTheme.titleLarge,
      ),
      content: Text(
        ('are you sure to logout ?'),
        style: getTitleFont(context),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                ('cancel'),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            TextButton(
              onPressed: () {
                localStorage.clearCache();
                Get.offAll(LoginScreen());
              },
              child: Text(
                ('logout'),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        )
      ],
    );
  }
}
