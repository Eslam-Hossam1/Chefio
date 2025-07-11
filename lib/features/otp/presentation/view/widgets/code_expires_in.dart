import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/otp/presentation/view/widgets/count_down_timer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

class CodeExpiresIn extends StatelessWidget {
  const CodeExpiresIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${AppLocalizationKeys.auth.verificationCodeViewCodeExpiresIn.tr()}: ',
          style: Styles.textStyleMedium15(context).copyWith(
            color: context.mainTextColor,
          ),
        ),
        CountdownTimer(seconds: 3 * 60),
      ],
    );
  }
}
