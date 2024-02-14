// ignore_for_file: file_names
import 'package:flutter/material.dart';

import '../../Utils/them.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    Key? key,
    this.titleAppBar,
  }) : super(key: key);

  final String? titleAppBar;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary1,
      centerTitle: true,
      title: Text(
      titleAppBar!,
        textAlign: TextAlign.center,
    ),
    titleTextStyle: const TextStyle(
        fontSize: 17,

        fontWeight: FontWeight.w700,
        color: AppColors.textColorWhiteBold),
    //  backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,

      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_sharp,
          size: 24,
          color: AppColors.textColorWhiteBold,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
