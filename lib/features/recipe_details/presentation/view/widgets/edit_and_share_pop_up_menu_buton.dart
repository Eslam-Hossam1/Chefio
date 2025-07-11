import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/dialog_helper.dart';
import 'package:chefio_app/core/utils/routing/routing_helper.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/app_colors.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/recipe_details/presentation/manager/recipe_details_actions_cubit/recipe_details_actions_cubit.dart';
import 'package:chefio_app/features/recipe_details/presentation/manager/recipe_details_cubit/recipe_details_cubit.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/custom_circle_glass_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditAndSharePopUpMenuButton extends StatelessWidget {
  const EditAndSharePopUpMenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: context.dialogBackgroundColor,
      child: CustomCircleGlassButton(
        child: Icon(
          FontAwesomeIcons.ellipsisVertical,
          color: Colors.white,
        ),
      ),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: Row(
              children: [
                Icon(Icons.share, color: context.mainTextColor),
                SizedBox(
                  width: 8,
                ),
                Text(
                  AppLocalizationKeys.recipeDetails.shareRecipe.tr(),
                  style: Styles.textStyleMedium15(context).copyWith(
                    color: context.mainTextColor,
                  ),
                ),
              ],
            ),
            onTap: () async {
              await context.read<RecipeDetailsActionsCubit>().shareRecipe(
                    recipeId: context
                        .read<RecipeDetailsCubit>()
                        .recipeDetailModel!
                        .id,
                  );
            },
          ),
          PopupMenuItem(
              child: Row(
                children: [
                  Icon(Icons.edit, color: context.mainTextColor),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    AppLocalizationKeys.recipeDetails.editRecipe.tr(),
                    style: Styles.textStyleMedium15(context).copyWith(
                      color: context.mainTextColor,
                    ),
                  ),
                ],
              ),
              onTap: () {
                RoutingHelper.pushEditRecipe(
                  context,
                  recipeDetailsModel:
                      context.read<RecipeDetailsCubit>().recipeDetailModel!,
                );
              }),
          PopupMenuItem(
              child: Row(
                children: [
                  const Icon(
                    Icons.delete,
                    color: AppColors.logoutText,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    AppLocalizationKeys.global.deleteRecipe.tr(),
                    style: Styles.textStyleMedium15(context).copyWith(
                      color: AppColors.logoutText,
                    ),
                  ),
                ],
              ),
              onTap: () {
                DialogHelper.showWarningDialog(
                  context,
                  errorMessage:
                      AppLocalizationKeys.global.deleteRecipeConfirmation.tr(),
                  btnOkOnPress: () {
                    context.read<RecipeDetailsCubit>().deleteRecipe(
                          recipeId: context
                              .read<RecipeDetailsCubit>()
                              .recipeDetailModel!
                              .id,
                        );
                  },
                );
              }),
        ];
      },
    );
  }
}
