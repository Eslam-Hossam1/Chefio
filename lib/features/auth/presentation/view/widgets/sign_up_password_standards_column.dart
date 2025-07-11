import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/auth/presentation/manager/validate_sign_up_password_cubit/validate_sign_up_password_cubit.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/password_standard.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SignUpPasswordStandardsColumn extends StatelessWidget {
  const SignUpPasswordStandardsColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidateSignUpPasswordCubit,
        ValidateSignUpPasswordState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizationKeys.auth.signUpViewYourPasswordMustContain.tr(),
              style: Styles.textStyleMedium17(context).copyWith(
                color: context.mainTextColor,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            PasswordStandard(
              isValid: BlocProvider.of<ValidateSignUpPasswordCubit>(context)
                  .isMinLengthValid,
              standardText:
                  AppLocalizationKeys.auth.signUpViewAtLeastCharacters.tr(),
            ),
            SizedBox(
              height: 16.h,
            ),
            PasswordStandard(
              isValid: BlocProvider.of<ValidateSignUpPasswordCubit>(context)
                  .isContainsNumberValid,
              standardText:
                  AppLocalizationKeys.auth.signUpViewMustContainNumber.tr(),
            ),
            SizedBox(
              height: 16.h,
            ),
            PasswordStandard(
              isValid: BlocProvider.of<ValidateSignUpPasswordCubit>(context)
                  .isContainsUppercaseLetter,
              standardText: AppLocalizationKeys
                  .auth.signUpViewContainsUppercaseLetter
                  .tr(),
            ),
            SizedBox(
              height: 16.h,
            ),
            PasswordStandard(
              isValid: BlocProvider.of<ValidateSignUpPasswordCubit>(context)
                  .isContainsSpecialLetter,
              standardText:
                  AppLocalizationKeys.auth.signUpViewContainsSpecialLetter.tr(),
            ),
            SizedBox(
              height: 16.h,
            ),
            PasswordStandard(
              isValid: BlocProvider.of<ValidateSignUpPasswordCubit>(context)
                  .isContainsLowercaseLetter,
              standardText: AppLocalizationKeys
                  .auth.signUpViewContainsLowercaseLetter
                  .tr(),
            )
          ],
        );
      },
    );
  }
}
