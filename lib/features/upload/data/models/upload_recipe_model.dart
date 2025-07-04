import 'dart:convert';

import 'package:chefio_app/core/api/api_keys.dart';
import 'package:dio/dio.dart';

class UploadRecipeModel {
  final MultipartFile foodImage;
  final String foodName;
  final String foodDescription;
  final String categoryId;
  final int foodCookDuration;
  final List<String> ingredients;
  final List<String> steps;

  const UploadRecipeModel({
    required this.ingredients,
    required this.steps,
    required this.foodName,
    required this.foodDescription,
    required this.foodCookDuration,
    required this.categoryId,
    required this.foodImage,
  });

  Map<String, dynamic> toJson() => {
        ApiKeys.recipePicture: foodImage,
        ApiKeys.foodName: foodName,
        ApiKeys.description: foodDescription,
        ApiKeys.cookingDuration: foodCookDuration,
        ApiKeys.categoryId: categoryId,
        ApiKeys.ingredients: jsonEncode(ingredients),
        ApiKeys.steps: jsonEncode(steps)
      };
}
