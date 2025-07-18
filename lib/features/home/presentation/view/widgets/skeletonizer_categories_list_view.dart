import 'package:chefio_app/core/models/category.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/categories_listview.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonizerCategoriesListView extends StatelessWidget {
  const SkeletonizerCategoriesListView({super.key});
  static List<Category> categories = List.generate(
    5,
    (index) => Category(name: "burger", id: ''),
  );

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        child: CategoriesListView(
            categories: categories, onCategoryPressed: (_) {}));
  }
}
