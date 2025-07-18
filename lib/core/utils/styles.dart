import 'dart:developer';

import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:chefio_app/core/utils/size_config.dart';

abstract class Styles {
  static TextStyle textStyleMedium12(context) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: _getResponsiveText(context, baseFontSize: 12),
    );
  }

  static TextStyle textStyleBold17(context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: _getResponsiveText(context, baseFontSize: 17),
    );
  }

  static TextStyle textStyleMedium15(context) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: _getResponsiveText(context, baseFontSize: 15),
    );
  }

  static TextStyle textStyleBold15(context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: _getResponsiveText(context, baseFontSize: 15),
    );
  }

  static TextStyle textStyleBold22(context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: _getResponsiveText(context, baseFontSize: 22),
    );
  }

  static TextStyle textStyleExtraBold40(context) {
    return TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: _getResponsiveText(context, baseFontSize: 40),
    );
  }

  static TextStyle textStyleBold30(context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: _getResponsiveText(context, baseFontSize: 30),
    );
  }

  static TextStyle textStyleSemiBold15(context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: _getResponsiveText(context, baseFontSize: 15),
    );
  }

  static TextStyle textStyleMedium34(context) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: _getResponsiveText(context, baseFontSize: 34),
    );
  }

  static TextStyle textStyleMedium24(context) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: _getResponsiveText(context, baseFontSize: 24),
    );
  }

  static TextStyle textStyleMedium17(context) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: _getResponsiveText(context, baseFontSize: 17),
    );
  }

  static TextStyle textStyleBold12(context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: _getResponsiveText(context, baseFontSize: 12),
    );
  }

  static TextStyle textStyleSemiBold34(context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: _getResponsiveText(context, baseFontSize: 34),
    );
  }

  static TextStyle textStyleAwesomeDialogTitle(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: _getResponsiveText(context, baseFontSize: 20),
      color: context.mainTextColor,
    );
  }

  static TextStyle textStyleAwesomeDialogDesc(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: _getResponsiveText(context, baseFontSize: 14),
      color: context.mainTextColor,
    );
  }

  static double _getResponsiveText(context, {required double baseFontSize}) {
    double scaleFactor = _getScaleFactor(context);
    double responsizeTextFontSize = scaleFactor * baseFontSize;
    double lowerLimit = baseFontSize * .75;

    double upperLimit = baseFontSize * 1.25;

    return responsizeTextFontSize.clamp(lowerLimit, upperLimit);
  }

  static double _getScaleFactor(context) {
    double width = MediaQuery.sizeOf(context).width;

    if (width < SizeConfig.tabletBreakPoint) {
      return width / Constants.kDesignWidth;
    } else {
      return width / 800;
    }
  }
}
