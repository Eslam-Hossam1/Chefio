import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/sliver_adaptive_padding.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/sliver_skeletonizer_recipes_grid.dart';
import 'package:chefio_app/features/search/presentation/views/widget/search_app_bar.dart';
import 'package:flutter/material.dart';

class SearchFirstLoading extends StatelessWidget {
  const SearchFirstLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAdaptivePadding(sliver: SliverSkeletonizerRecipesGrid());
  }
}
