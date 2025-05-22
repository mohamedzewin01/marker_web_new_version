import 'package:bloc/bloc.dart';
import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/core/uses_cases/profile/profile_use_case_repo.dart';
import 'package:fada_alhalij_web/core/utils/cashed_data_shared_preferences.dart';
import 'package:fada_alhalij_web/features/auth/data/models/request/edit_profile_request.dart';
import 'package:fada_alhalij_web/features/auth/domain/entities/auth_entities.dart';
import 'package:fada_alhalij_web/features/profile/data/models/request/get_user_info_request.dart';
import 'package:fada_alhalij_web/features/profile/domain/entities/profile_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';


@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileUseCaseRepo) : super(ProfileInitial());
  final ProfileUseCaseRepo _profileUseCaseRepo;

  static ProfileCubit get(context) => BlocProvider.of(context);
  Future<void> getProfile() async {
    emit(ProfileLoading());
    int? userId = await CacheService.getData(key: CacheConstants.userId) ?? 0;
    GetUserInfoRequest getUserInfoRequest = GetUserInfoRequest(
      id: userId,
    );
    final result = await _profileUseCaseRepo.getUserInfo(getUserInfoRequest);
    switch (result) {
      case Success<GetUserInfoEntity?>():
        {
          if (!isClosed) {
            await CacheService.setData(
              key: CacheConstants.userName,
              value: editNameController,
            );
            await CacheService.setData(
              key: CacheConstants.userEmail,
              value: editEmailController.text,
            );
            await CacheService.setData(
              key: CacheConstants.userPhone,
              value: editPhoneController.text,
            );

            emit(ProfileSuccess(result.data!));
          }
        }
      case Fail<GetUserInfoEntity?>():
        {
          emit(ProfileFail(result.exception));
        }
    }


  }


  TextEditingController editEmailController = TextEditingController(
    text: CacheService.getData(key: CacheConstants.userEmail),
  );
  TextEditingController editNameController = TextEditingController(
    text: CacheService.getData(key: CacheConstants.userName),
  );

  TextEditingController editPhoneController = TextEditingController(
    text: CacheService.getData(key: CacheConstants.userPhone),
  );
  Future<void> editProfile() async {
    emit(EditProfileLoading());
    EditProfileRequest editProfileRequest = EditProfileRequest(
      id: CacheService.getData(key: CacheConstants.userId),
      email: editEmailController.text,
      name: editNameController.text,
      phone: editPhoneController.text,
    );
    var result = await _profileUseCaseRepo.editProfile(editProfileRequest);

    switch (result) {
      case Success<EditProfileEntity?>():
        {
          if (!isClosed) {
            await CacheService.setData(
              key: CacheConstants.userName,
              value: editNameController,
            );
            await CacheService.setData(
              key: CacheConstants.userEmail,
              value: editEmailController.text,
            );
            await CacheService.setData(
              key: CacheConstants.userPhone,
              value: editPhoneController.text,
            );

            emit(EditProfileSuccess(result.data!));
          }
        }
      case Fail<EditProfileEntity?>():
        {
          emit(EditProfileFail(result.exception));
        }
    }
  }



}
