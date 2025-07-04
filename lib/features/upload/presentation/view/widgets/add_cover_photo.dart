import 'dart:developer';

import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/choose_image_source_bottom_sheet.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/custom_cached_network_image.dart';
import 'package:chefio_app/features/recipe_details/data/models/recipe_details_success/recipe_details_model.dart';
import 'package:chefio_app/features/upload/presentation/manager/add_cover_photo_cubit.dart/add_cover_photo_cubit.dart';
import 'package:chefio_app/features/upload/presentation/manager/upload_form_cubit/upload_form_cubit.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/empty_cover_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCoverPhoto extends StatefulWidget {
  const AddCoverPhoto({
    super.key,
    this.recipeDetailModel,
  });
  final RecipeDetailsModel? recipeDetailModel;
  @override
  State<AddCoverPhoto> createState() => _AddCoverPhotoState();
}

class _AddCoverPhotoState extends State<AddCoverPhoto> {
  @override
  void initState() {
    context.read<AddCoverPhotoCubit>().init(
          imageUrl: widget.recipeDetailModel?.recipePicture,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final addCoverPhotoCubit = context.read<AddCoverPhotoCubit>();

    return Center(
      child: SizedBox(
        width: (MediaQuery.sizeOf(context).width * .8).clamp(200, 400),
        child: AspectRatio(
          aspectRatio: 1,
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                backgroundColor: context.scaffoldBackgroundColor,
                context: context,
                builder: (context) {
                  return ChooseImageSourceBottomSheet(
                    pickImageMethod: addCoverPhotoCubit.pickRecipeImage,
                  );
                },
              );
            },
            child: BlocConsumer<AddCoverPhotoCubit, AddCoverPhotoState>(
                listener: (context, state) {
              if (state is PickedRecipeImage) {
                context.read<UploadFormCubit>().foodImage =
                    state.recipeImageFile;
              }
            }, builder: (context, state) {
              if (state is UrlImage) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CustomCachedNetworkImage(url: state.imageUrl),
                );
              } else if (state is PickedRecipeImage) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.file(
                    state.recipeImageFile,
                    fit: BoxFit.contain,
                  ),
                );
              } else {
                return EmptyCoverPhoto();
              }
            }),
          ),
        ),
      ),
    );
  }
}
