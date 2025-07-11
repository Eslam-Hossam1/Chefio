import 'dart:developer';

import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:chefio_app/core/helpers/cropped_image_picker_helper.dart';
import 'package:chefio_app/core/helpers/share_helper.dart';
import 'package:chefio_app/core/services/categories_service.dart';
import 'package:chefio_app/core/utils/routing/routing_helper.dart';
import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:chefio_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:chefio_app/features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:chefio_app/features/auth/presentation/manager/log_in_cubit.dart/log_in_cubit.dart';
import 'package:chefio_app/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:chefio_app/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:chefio_app/features/auth/presentation/manager/validate_sign_up_password_cubit/validate_sign_up_password_cubit.dart';
import 'package:chefio_app/features/auth/presentation/view/forgot_password_view.dart';
import 'package:chefio_app/features/auth/presentation/view/login_view.dart';
import 'package:chefio_app/features/auth/presentation/view/reset_password_view.dart';
import 'package:chefio_app/features/auth/presentation/view/sign_up_view.dart';
import 'package:chefio_app/features/edit_profile/data/repos/edit_profile_repo_impl.dart';
import 'package:chefio_app/features/edit_profile/presentation/manager/edit_profile/edit_profile_cubit.dart';
import 'package:chefio_app/features/edit_profile/presentation/views/edit_profile_view.dart';
import 'package:chefio_app/features/edit_recipe/data/models/edit_recipe_form_model.dart';
import 'package:chefio_app/features/edit_recipe/data/repos/edit_recipe_repo_impl.dart';
import 'package:chefio_app/features/edit_recipe/presentation/manager/edit_recipe_cover_photo_cubit.dart/edit_recipe_cover_photo_cubit.dart';
import 'package:chefio_app/features/edit_recipe/presentation/manager/edit_recipe_form_cubit/edit_recipe_form_cubit.dart';
import 'package:chefio_app/features/edit_recipe/presentation/manager/edit_recipe_submit_cubit/edit_recipe_submit_cubit.dart';
import 'package:chefio_app/features/edit_recipe/presentation/view/edit_recipe_view.dart';
import 'package:chefio_app/features/main/presentation/view/main_view.dart';
import 'package:chefio_app/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:chefio_app/features/otp/data/models/otp_reason.dart';
import 'package:chefio_app/features/otp/data/repos/otp_repo_impl.dart';
import 'package:chefio_app/features/otp/presentation/manager/otp_cubit/otp_cubit.dart';
import 'package:chefio_app/features/otp/presentation/view/otp_view.dart';
import 'package:chefio_app/features/profile/data/models/profile_model/profile_model.dart';
import 'package:chefio_app/features/profile/data/repos/profile_repo_impl.dart';
import 'package:chefio_app/features/profile/presentation/manager/chef_liked_recipes_cubit/chef_liked_recipes_cubit.dart';
import 'package:chefio_app/features/profile/presentation/manager/chef_profile_recipes_cubit/chef_profile_recipes_cubit.dart';
import 'package:chefio_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:chefio_app/features/profile/presentation/manager/profile_follow_button_cubit/profile_follow_button_cubit.dart';
import 'package:chefio_app/features/profile/presentation/views/profile_view.dart';
import 'package:chefio_app/features/recipe_details/data/models/recipe_details_success/recipe_details_model.dart';
import 'package:chefio_app/features/recipe_details/data/repos/recipe_details_repo_impl.dart';
import 'package:chefio_app/features/recipe_details/presentation/manager/recipe_details_actions_cubit/recipe_details_actions_cubit.dart';
import 'package:chefio_app/features/recipe_details/presentation/manager/recipe_details_cubit/recipe_details_cubit.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/recipe_details_view.dart';
import 'package:chefio_app/features/settings/presentation/manager/settings_cubit/settings_cubit.dart';
import 'package:chefio_app/features/settings/presentation/views/language_selection_view.dart';
import 'package:chefio_app/features/settings/presentation/views/settings_view.dart';
import 'package:chefio_app/features/settings/presentation/views/theme_selection_view.dart';
import 'package:chefio_app/features/splash/presentation/view/splash_view.dart';
import 'package:chefio_app/features/upload/data/repos/upload_repo_impl.dart';
import 'package:chefio_app/features/upload/presentation/manager/add_cover_photo_cubit.dart/add_cover_photo_cubit.dart';
import 'package:chefio_app/features/upload/presentation/manager/upload_form_cubit/upload_form_cubit.dart';
import 'package:chefio_app/features/upload/presentation/manager/upload_submit_cubit/upload_submit_cubit.dart';
import 'package:chefio_app/features/upload/presentation/view/upload_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'shell_branches.dart';

class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    redirect: (context, state) {
      log('location: ${state.uri.path}');
      log('uri: ${state.uri}');
      log('pathSegments: ${state.uri.pathSegments}');
      log('queryParameters: ${state.uri.queryParameters}');

      final isLoggedIn = getIt<AuthCredentialsHelper>().userIsAuthenticated();

      if (state.uri.pathSegments.contains('recipes')) {
        if (!isLoggedIn) {
          return RoutePaths.login;
        }

        final recipeId = state.uri.pathSegments.last;
        return RoutingHelper.getRecipeDetailsPath(recipeId: recipeId);
      }
      if (state.uri.pathSegments.contains('profile')) {
        if (!isLoggedIn) {
          return RoutePaths.login;
        }

        final chefId = state.uri.pathSegments.last;
        return RoutingHelper.getProfilePath(chefId: chefId);
      }

      return null;
    },
    initialLocation: RoutePaths.splash,
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state, navigationShell) {
          return MainScaffoldView(navigationShell: navigationShell);
        },
        branches: ShellBranches.branches,
      ),
      GoRoute(
        path: RoutePaths.splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
          path: RoutePaths.profile,
          builder: (context, state) {
            final String chefId = state.pathParameters['id']!;

            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => ChefProfileRecipesCubit(
                    profileRepo: getIt<ProfileRepoImpl>(),
                    authCredentialsHelper: getIt<AuthCredentialsHelper>(),
                  ),
                ),
                BlocProvider(
                  create: (context) => ChefLikedRecipesCubit(
                    profileRepo: getIt<ProfileRepoImpl>(),
                    authCredentialsHelper: getIt<AuthCredentialsHelper>(),
                  ),
                ),
                BlocProvider(
                  create: (context) => ProfileFollowButtonCubit(
                    authCreadentialsHelper: getIt<AuthCredentialsHelper>(),
                  ),
                ),
                BlocProvider(
                  create: (context) => ProfileCubit(
                    profileRepo: getIt<ProfileRepoImpl>(),
                  ),
                ),
              ],
              child: ProfileView(
                chefId: chefId,
              ),
            );
          }),
      GoRoute(
          path: RoutePaths.recipeDetails,
          builder: (context, state) {
            final String recipeId = state.pathParameters['id']!;
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => RecipeDetailsCubit(
                    getIt<RecipeDetailsRepoImpl>(),
                  ),
                ),
                BlocProvider(
                  create: (context) => RecipeDetailsActionsCubit(
                    authCredentialsHelper: getIt<AuthCredentialsHelper>(),
                    shareHelper: getIt<ShareHelper>(),
                  ),
                ),
              ],
              child: RecipeDetailsView(
                id: recipeId,
              ),
            );
          }),
      GoRoute(
        path: RoutePaths.upload,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => UploadFormCubit(
                getIt<UploadRepoImpl>(),
              ),
            ),
            BlocProvider(
              create: (context) => UploadSubmitCubit(
                uploadRepo: getIt<UploadRepoImpl>(),
              ),
            ),
            BlocProvider(
              create: (context) =>
                  AddCoverPhotoCubit(getIt<CroppedImagePickerHelper>()),
            ),
          ],
          child: UploadView(),
        ),
      ),
      GoRoute(
          path: RoutePaths.editRecipe,
          builder: (context, state) {
            EditRecipeFormModel editRecipeFormModel =
                EditRecipeFormModel.fromRecipeDetailsModel(
              recipeDetailsModel: state.extra as RecipeDetailsModel,
            );
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => EditRecipeFormCubit(
                    categoriesService: getIt<CategoriesService>(),
                    editRecipeFormModel: editRecipeFormModel,
                  ),
                ),
                BlocProvider(
                  create: (context) => EditRecipeSubmitCubit(
                    editRecipeRepo: getIt<EditRecipeRepoImpl>(),
                  ),
                ),
                BlocProvider(
                  create: (context) => EditRecipeCoverPhotoCubit(
                    croppedImagePickerHelper: getIt<CroppedImagePickerHelper>(),
                    imageUrl: editRecipeFormModel.foodUrlImage,
                  ),
                ),
              ],
              child: EditView(),
            );
          }),
      GoRoute(
        path: RoutePaths.onboarding,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: RoutePaths.login,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              LogInCubit(getIt<AuthRepoImpl>(), getIt<AuthCredentialsHelper>()),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: RoutePaths.settings,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => SettingsCubit(
              authCredentialsHelper: getIt<AuthCredentialsHelper>(),
              authRepo: getIt<AuthRepoImpl>(),
            ),
            child: const SettingsView(),
          );
        },
      ),
      GoRoute(
        path: RoutePaths.themeSelection,
        builder: (context, state) => const ThemeSelectionView(),
      ),
      GoRoute(
        path: RoutePaths.languageSelection,
        builder: (context, state) => const LanguageSelectionView(),
      ),
      GoRoute(
        path: RoutePaths.editProfile,
        builder: (context, state) {
          final ProfileModel profileModel = state.extra as ProfileModel;
          return BlocProvider(
            create: (context) => EditProfileCubit(
              croppedImagePickerHelper: getIt<CroppedImagePickerHelper>(),
              editProfileRepo: getIt<EditProfileRepoImpl>(),
            ),
            child: EditProfileView(
              profileModel: profileModel,
            ),
          );
        },
      ),
      GoRoute(
        path: RoutePaths.signup,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => SignUpCubit(getIt<AuthRepoImpl>())),
            BlocProvider(create: (context) => ValidateSignUpPasswordCubit()),
          ],
          child: const SignUpView(),
        ),
      ),

      GoRoute(
        path: RoutePaths.forgetPassword,
        builder: (context, state) => BlocProvider(
          create: (context) => ForgotPasswordCubit(getIt<AuthRepoImpl>()),
          child: const ForgotPasswordView(),
        ),
      ),
      GoRoute(
        path: RoutePaths.resetPassword,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ValidateSignUpPasswordCubit()),
            BlocProvider(
                create: (context) => ResetPasswordCubit(getIt<AuthRepoImpl>())),
          ],
          child: ResetPasswordView(email: state.extra as String),
        ),
      ),
      GoRoute(
          path: RoutePaths.otp,
          builder: (context, state) {
            final OtpReason otpReason = state.extra as OtpReason;
            log('📦 Received extra from GoRouter: ${state.extra}');
            return BlocProvider(
              create: (context) => OtpCubit(
                otpRepo: getIt<OtpRepoImpl>(),
                otpReason: otpReason,
              ),
              child: OtpView(),
            );
          }),
    ],
  );
}
