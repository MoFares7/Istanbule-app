import 'package:flutter/material.dart';
import 'package:istanbule/features/Utils/them.dart';
import 'package:responsive_framework/responsive_framework.dart';

getTopHeadFont(BuildContext context) {
  return TextStyle(
    fontSize: ResponsiveValue(
      context,
      valueWhen: [
        const Condition.equals(name: MOBILE, value: 18.0),
        const Condition.equals(name: TABLET, value: 22.0),
        const Condition.equals(name: DESKTOP, value: 24.0),
        const Condition.largerThan(name: DESKTOP, value: 24.0),
      ],
      defaultValue: 10.0,
    ).value,
    fontWeight: FontWeight.w800,
    color: AppColors.textColorBlackBold,
  );
}

getHeadFont(BuildContext context) {
  return TextStyle(
    fontSize: ResponsiveValue(
      context,
      valueWhen: [
        const Condition.equals(name: MOBILE, value: 16.0),
        const Condition.equals(name: TABLET, value: 18.0),
        const Condition.equals(name: DESKTOP, value: 20.0),
        const Condition.largerThan(name: DESKTOP, value: 22.0),
      ],
      defaultValue: 16.0,
    ).value,
    fontWeight: FontWeight.w800,
    color: AppColors.textColorBlackBold,
  );
}

getTitleHomeFont(BuildContext context) {
  return TextStyle(
      fontSize: ResponsiveValue(
        context,
        valueWhen: [
          const Condition.equals(name: MOBILE, value: 18.0),
          const Condition.equals(name: TABLET, value: 18.0),
          const Condition.equals(name: DESKTOP, value: 19.0),
          const Condition.largerThan(name: DESKTOP, value: 20.0),
        ],
        defaultValue: 18.0,
      ).value,
      color: AppColors.textColorBlackBold,
      fontWeight: FontWeight.bold);
}

getTitleFont(BuildContext context) {
  return TextStyle(
    fontSize: ResponsiveValue(
      context,
      valueWhen: [
        const Condition.equals(name: MOBILE, value: 14.0),
        const Condition.equals(name: TABLET, value: 15.0),
        const Condition.equals(name: DESKTOP, value: 17.0),
        const Condition.largerThan(name: DESKTOP, value: 20.0),
      ],
      defaultValue: 14.0,
    ).value,
    color: AppColors.textColorBlackBold,
  );
}

getSupTitleFont(BuildContext context) {
  return TextStyle(
    fontSize: ResponsiveValue(
      context,
      valueWhen: [
        const Condition.equals(name: MOBILE, value: 13.0),
        const Condition.equals(name: TABLET, value: 15.0),
        const Condition.equals(name: DESKTOP, value: 17.0),
        const Condition.largerThan(name: DESKTOP, value: 18.0),
      ],
      defaultValue: 10.0,
    ).value,
    color: AppColors.textColorBlackRegular,
  );
}

getButtonFont(BuildContext context) {
  return TextStyle(
    fontSize: ResponsiveValue(
      context,
      valueWhen: [
        const Condition.equals(name: MOBILE, value: 13.0),
        const Condition.equals(name: TABLET, value: 14.0),
        const Condition.equals(name: DESKTOP, value: 15.0),
        const Condition.largerThan(name: DESKTOP, value: 16.0),
      ],
      defaultValue: 14.0,
    ).value,
    fontWeight: FontWeight.w700,
    color: AppColors.textColorWhiteBold,
  );
}

getButtonBlackFont(BuildContext context) {
  return TextStyle(
    fontSize: ResponsiveValue(
      context,
      valueWhen: [
        const Condition.equals(name: MOBILE, value: 13.0),
        const Condition.equals(name: TABLET, value: 14.0),
        const Condition.equals(name: DESKTOP, value: 15.0),
        const Condition.largerThan(name: DESKTOP, value: 16.0),
      ],
      defaultValue: 12.0,
    ).value,
    fontWeight: FontWeight.w700,
    color: AppColors.textColorBlackBold,
  );
}

getBodyWhite(BuildContext context) {
  return TextStyle(
    fontSize: ResponsiveValue(
      context,
      valueWhen: [
        const Condition.equals(name: MOBILE, value: 12.0),
        const Condition.equals(name: TABLET, value: 14.0),
        const Condition.equals(name: DESKTOP, value: 16.0),
        const Condition.largerThan(name: DESKTOP, value: 18.0),
      ],
      defaultValue: 12.0,
    ).value,
    color: Colors.white,
  );
}
