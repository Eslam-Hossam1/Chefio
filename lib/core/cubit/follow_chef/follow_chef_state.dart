part of 'follow_chef_cubit.dart';

sealed class FollowChefState extends Equatable {
  const FollowChefState();

  @override
  List<Object> get props => [];
}

final class FollowChefInitial extends FollowChefState {}

final class FollowChefSuccess extends FollowChefState
    implements FollowChefStateWithId {
  @override
  final String chefId;
  final int myProfileFollowingChange;
  const FollowChefSuccess({
    required this.chefId,
    required this.myProfileFollowingChange,
  });
}

final class FollowChefLoading extends FollowChefState
    implements FollowChefStateWithId {
  @override
  final String chefId;

  const FollowChefLoading({required this.chefId});
}

final class FollowChefFaiure extends FollowChefState
    implements FollowChefStateWithId {
  final String errorMessage;
  final String errorLocalizationKey;
  @override
  final String chefId;
  const FollowChefFaiure({
    required this.errorMessage,
    required this.errorLocalizationKey,
    required this.chefId,
  });
}

abstract class FollowChefStateWithId extends FollowChefState {
  final String chefId;

  const FollowChefStateWithId({required this.chefId});
}
