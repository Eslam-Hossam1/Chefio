part of 'edit_recipe_form_cubit.dart';

sealed class EditRecipeFormState extends Equatable {
  const EditRecipeFormState();

  @override
  List<Object> get props => [];
}


final class CategoriesLoaded extends EditRecipeFormState {}
