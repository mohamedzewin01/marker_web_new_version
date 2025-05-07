part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthSignUpLoading extends AuthState {}
final class AuthSignUpSuccess extends AuthState {
  final AuthSignupEntity? authSignupEntity;
  AuthSignUpSuccess(this.authSignupEntity);
}
final class AuthSignUpFail extends AuthState {
  final Exception exception;
  AuthSignUpFail(this.exception);
}

final class AuthSignInLoading extends AuthState {}
final class AuthSignInSuccess extends AuthState {
  final AuthSingInEntity? authLoginEntity;
  AuthSignInSuccess(this.authLoginEntity);
}
final class AuthSignInFail extends AuthState {
  final Exception exception;
  AuthSignInFail(this.exception);
}