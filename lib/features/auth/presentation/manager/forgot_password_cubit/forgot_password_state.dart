part of 'forgot_password_cubit.dart';

sealed class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object> get props => [];
}

final class ForgotPasswordInitial extends ForgotPasswordState {}

final class ForgotPasswordSuccess extends ForgotPasswordState {
  final String email;

  const ForgotPasswordSuccess({required this.email});
}

final class ForgotPasswordLoading extends ForgotPasswordState {}

final class ForgotPasswordFailure extends ForgotPasswordState {
  final String errorMessage;
  final String errorLocalizaitonKey;
  const ForgotPasswordFailure(
      {required this.errorMessage, required this.errorLocalizaitonKey});
}
