

import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/features/auth/data/models/request/edit_profile_request.dart';
import 'package:fada_alhalij_web/features/auth/domain/entities/auth_entities.dart';
import 'package:fada_alhalij_web/features/profile/data/data_sources/profile_data_sources_repo.dart';
import 'package:fada_alhalij_web/features/profile/data/models/request/get_user_info_request.dart';
import 'package:fada_alhalij_web/features/profile/domain/entities/profile_entities.dart';
import 'package:fada_alhalij_web/features/profile/domain/repo/profile_repo.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileDataSourcesRepo profileDataSourcesRepo;

  ProfileRepoImpl(this.profileDataSourcesRepo);

  @override
  Future<Result<GetUserInfoEntity?>> getUserInfo(GetUserInfoRequest getUserInfoRequest) {
    return profileDataSourcesRepo.getUserInfo(getUserInfoRequest);
  }

  @override
  Future<Result<EditProfileEntity?>> editProfile(EditProfileRequest editProfileRequest) {
  return profileDataSourcesRepo.editProfile(editProfileRequest);
  }

}