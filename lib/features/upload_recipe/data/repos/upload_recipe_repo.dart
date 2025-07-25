import 'package:chefio_app/core/errors/api_failure.dart';
import 'package:chefio_app/core/models/category.dart';
import 'package:chefio_app/features/upload_recipe/data/models/upload_recipe_model.dart';
import 'package:dartz/dartz.dart';

abstract class UploadRecipeRepo {
  Future<Either<ApiFailure, void>> uploadRecipe(
      {required UploadRecipeModel uploadRecipeModel});
  Future<Either<ApiFailure, List<Category>>> fetchCategories();
}
