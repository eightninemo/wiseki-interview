import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

import 'colors.dart';
import 'text_style.dart';

displayErrorMotionToast(
  BuildContext context,
  String description,
) {
  MotionToast(
    description: Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Center(
        child: Text(
          description,
          textAlign: TextAlign.center,
          style: mediumtextStyle(14, colorWhite),
        ),
      ),
    ),
    primaryColor: errorColor,
    iconSize: 28,
    displaySideBar: false,
    enableAnimation: false,
    borderRadius: 50,
    backgroundType: BackgroundType.solid,
    animationCurve: Curves.easeOutExpo,
    padding: const EdgeInsets.only(left: 70, right: 70),
    dismissable: false,
  ).show(context);
}

displaySuccessMotionToast(BuildContext context, String description,
    {Function? onClose}) {
  MotionToast(
    description: Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Center(
        child: Text(
          description,
          textAlign: TextAlign.center,
          style: mediumtextStyle(14, colorWhite),
        ),
      ),
    ),
    primaryColor: successColor,
    iconSize: 28,
    displaySideBar: false,
    enableAnimation: false,
    borderRadius: 50,
    backgroundType: BackgroundType.solid,
    animationCurve: Curves.easeOutExpo,
    padding: const EdgeInsets.only(left: 70, right: 70),
    dismissable: false,
    onClose: onClose,
  ).show(context);
}

displayInfoMotionToast(
  BuildContext context,
  String description,
) {
  MotionToast(
    description: Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Center(
        child: Text(
          description,
          textAlign: TextAlign.center,
          style: mediumtextStyle(14),
        ),
      ),
    ),
    primaryColor: const Color(0xFFDADADA),
    iconSize: 28,
    displaySideBar: false,
    enableAnimation: false,
    borderRadius: 50,
    position: MotionToastPosition.center,
    backgroundType: BackgroundType.solid,
    animationDuration: const Duration(seconds: 2),
    animationCurve: Curves.easeInOut,
    padding: const EdgeInsets.only(left: 70, right: 70),
    dismissable: false,
  ).show(context);
}
