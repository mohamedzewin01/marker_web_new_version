part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class ProfileSuccess extends ProfileState {
  final GetUserInfoEntity getUserInfoEntity;

  ProfileSuccess(this.getUserInfoEntity);
}
final class ProfileFail extends ProfileState {
  final Exception exception;

  ProfileFail(this.exception);
}
final class ProfileLoading extends ProfileState {}
final class EditProfileLoading extends ProfileState {}
final class  EditProfileSuccess extends ProfileState {
  final EditProfileEntity? editProfileEntity;
  EditProfileSuccess(this.editProfileEntity);
}
final class  EditProfileFail extends ProfileState {
  final Exception exception;
  EditProfileFail(this.exception);
}