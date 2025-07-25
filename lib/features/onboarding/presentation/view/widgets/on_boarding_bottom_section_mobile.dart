import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/onboarding/presentation/view/widgets/on_boarding_get_start_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingBottomSectionMobile extends StatelessWidget {
  const OnBoardingBottomSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 48.h,
          ),
          Text(
            AppLocalizationKeys.onBoarding.title.tr(),
            style: Styles.textStyleBold22(context).copyWith(
              color: context.mainTextColor,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            textAlign: TextAlign.center,
            AppLocalizationKeys.onBoarding.body.tr(),
            style: Styles.textStyleMedium17(context).copyWith(
              color: context.secondaryTextColor,
            ),
          ),
          Expanded(
              child: SizedBox(
            height: 32.h,
          )),
          OnBoardingStartButton(
            btnTextStyle: Styles.textStyleBold15(context).copyWith(
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
        ],
      ),
    );
  }
}
