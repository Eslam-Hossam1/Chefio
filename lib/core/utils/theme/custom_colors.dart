import 'package:flutter/material.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  final Color mainTextColor;
  final Color secondaryTextColor;
  final Color formColor;
  final Color toastColor;
  final Color cachedNetworkImagePlaceholderColor;
  const CustomColors({
    required this.mainTextColor,
    required this.secondaryTextColor,
    required this.formColor,
    required this.toastColor,
    required this.cachedNetworkImagePlaceholderColor,
  });

  @override
  CustomColors copyWith({
    Color? mainTextColor,
    Color? secondaryTextColor,
    Color? formColor,
    Color? toastColor,
    Color? cachedNetworkImagePlaceholderColor,
  }) {
    return CustomColors(
      mainTextColor: mainTextColor ?? this.mainTextColor,
      secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
      formColor: formColor ?? this.formColor,
      toastColor: toastColor ?? this.toastColor,
      cachedNetworkImagePlaceholderColor: cachedNetworkImagePlaceholderColor ??
          this.cachedNetworkImagePlaceholderColor,
    );
  }

  @override
  CustomColors lerp(CustomColors? other, double t) {
    if (other == null) return this;
    return CustomColors(
      mainTextColor: Color.lerp(mainTextColor, other.mainTextColor, t)!,
      secondaryTextColor:
          Color.lerp(secondaryTextColor, other.secondaryTextColor, t)!,
      formColor: Color.lerp(formColor, other.formColor, t)!,
      toastColor: Color.lerp(toastColor, other.toastColor, t)!,
      cachedNetworkImagePlaceholderColor: Color.lerp(
          cachedNetworkImagePlaceholderColor,
          other.cachedNetworkImagePlaceholderColor,
          t)!,
    );
  }
}
