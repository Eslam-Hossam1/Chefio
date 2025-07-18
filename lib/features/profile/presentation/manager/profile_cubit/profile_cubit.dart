import 'package:bloc/bloc.dart';
import 'package:chefio_app/features/profile/data/models/profile_model/profile_model.dart';
import 'package:chefio_app/features/profile/data/repos/profile_repo.dart';
import 'package:equatable/equatable.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  ProfileCubit({required ProfileRepo profileRepo})
      : _profileRepo = profileRepo,
        super(ProfileInitial());
  ProfileModel? profileModel;
  Future<void> fetchChefProfileWithInitialRecipes({
    required String chefId,
    int limit = 30,
  }) async {
    emit(ProfileLoading());
    var result = await _profileRepo.fetchProfileWithInitialChefRecipes(
      chefId: chefId,
      page: 1,
      limit: limit,
    );
    result.fold(
      (failure) => emit(
        ProfileFailure(
          errMsg: failure.errMsg,
          errLocalizationError: failure.localizaitonKey,
        ),
      ),
      (profileModel) {
        this.profileModel = profileModel;
        emit(
          ProfileSuccess(),
        );
      },
    );
  }

  Future<void> refresh({
    int limit = 30,
  }) async =>
      await fetchChefProfileWithInitialRecipes(
        chefId: profileModel!.id,
      );
}
