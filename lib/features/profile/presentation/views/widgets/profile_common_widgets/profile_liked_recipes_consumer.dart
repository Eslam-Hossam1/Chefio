import 'package:chefio_app/core/Functions/show_custom_toast.dart';
import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/widgets/custom_info_message_with_button.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/custom_text_info_message.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/sliver_skeletonizer_recipes_grid.dart';
import 'package:chefio_app/features/profile/presentation/manager/chef_liked_recipes_cubit/chef_liked_recipes_cubit.dart';
import 'package:chefio_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_liked_recipes_grid.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileLikedRecipesConsumer extends StatefulWidget {
  const ProfileLikedRecipesConsumer({
    super.key,
    required this.chefId,
  });
  final String chefId;
  @override
  State<ProfileLikedRecipesConsumer> createState() =>
      _ProfileLikedRecipesConsumerState();
}

class _ProfileLikedRecipesConsumerState
    extends State<ProfileLikedRecipesConsumer> {
  @override
  void initState() {
    context.read<ChefLikedRecipesCubit>().fetchChefLikedRecipes(
          chefId: widget.chefId,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChefLikedRecipesCubit, ChefLikedRecipesState>(
      listener: (context, state) {
        if (state is FetchMoreLikedRecipesFailure) {
          showCustomToast(
            context,
            message: state.errLocalizationKey.tr(),
          );
        }
      },
      builder: (context, state) {
        if (state is LikedRecipesInitialFetchFailure) {
          return SliverToBoxAdapter(
            child: CustomInfoMessageWithButton(
              message: state.errLocalizationKey.tr(),
              onPressed: () {
                context.read<ChefLikedRecipesCubit>().fetchChefLikedRecipes(
                      chefId: context.read<ProfileCubit>().profileModel!.id,
                    );
              },
            ),
          );
        } else if (state is LikedRecipesInitialFetch) {
          return SliverSkeletonizerRecipesGrid();
        } else if (state is MyProfileEmptyLikedRecipes) {
          return SliverToBoxAdapter(
            child: CustomTextInfoMessage(
              text: AppLocalizationKeys.profile.myProfileNoLikedRecipesMessage
                  .tr(),
            ),
          );
        } else if (state is EmptyChefLikedRecipes) {
          return SliverToBoxAdapter(
            child: CustomTextInfoMessage(
              text: AppLocalizationKeys.profile.chefNoLikedRecipes.tr(),
            ),
          );
        } else {
          return ProfileLikedRecipesGrid(
            recipes: context.read<ChefLikedRecipesCubit>().chefLikedRecipes,
          );
        }
      },
    );
  }
}
