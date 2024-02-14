// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../Utils/them.dart';

class SearchField extends StatelessWidget {
  SearchField({
    Key? key,
    this.onSearch,
  }) : super(key: key);
  final Function(String?)? onSearch;
  final ValueNotifier<String?> searchText = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    return TextField(
      onChanged: (value) {
        searchText.value = value == '' ? null : value;
        onSearch!(searchText.value);
      },
      decoration: InputDecoration(
        hintText: ('Search on Product'.tr),
        contentPadding: EdgeInsets.symmetric(
          horizontal: isTablet ? 14 : 13,
          vertical: isTablet ? 13 : 12,
        ),
        fillColor: Theme.of(context).cardColor,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        hintStyle: TextStyle(
            color: Theme.of(context).dividerColor.withOpacity(0.7),
            fontSize: isTablet ? 17 : 15),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: isTablet ? 13 : 13,
              vertical: isTablet ? 12 : 11,
            ),
            margin: EdgeInsets.symmetric(
              horizontal: isTablet ? 14 : 13,
              vertical: isTablet ? 12 : 11,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: SvgPicture.asset(
              "assets/icons/search.svg",
              height: 20,
              color: AppColors.textColorWhiteBold,
            ),
          ),
        ),
      ),
    );
  }
}
