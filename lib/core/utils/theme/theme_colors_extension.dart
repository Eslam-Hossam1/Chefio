import 'package:flutter/material.dart';
import 'custom_colors.dart';

extension ThemeColorsExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  CustomColors get customColorsExtension => theme.extension<CustomColors>()!;
  ColorScheme get colorScheme => theme.colorScheme;

  Color get mainTextColor => customColorsExtension.mainTextColor;
  Color get secondaryTextColor => customColorsExtension.secondaryTextColor;
  Color get toastColor => customColorsExtension.toastColor;
  Color get cachedNetworkImagePlaceholderColor =>
      customColorsExtension.cachedNetworkImagePlaceholderColor;
  Color get formColor => customColorsExtension.formColor;
  Color get outlineColor => colorScheme.outline;
  Color get dialogBackgroundColor => theme.dialogBackgroundColor;
  Color get primaryColor => colorScheme.primary;
  Color get secondaryColor => colorScheme.secondary;
  Color get scaffoldBackgroundColor => theme.scaffoldBackgroundColor;
}
