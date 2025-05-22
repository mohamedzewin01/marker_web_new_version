import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/core/uses_cases/profile/profile_use_case_repo.dart';
import 'package:fada_alhalij_web/features/auth/data/models/request/edit_profile_request.dart';
import 'package:fada_alhalij_web/features/auth/domain/entities/auth_entities.dart';
import 'package:fada_alhalij_web/features/profile/data/models/request/get_user_info_request.dart';
import 'package:fada_alhalij_web/features/profile/domain/entities/profile_entities.dart';
import 'package:fada_alhalij_web/features/profile/domain/repo/profile_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileUseCaseRepo)
class ProfileUseCaseRepoImpl implements ProfileUseCaseRepo {
  final ProfileRepo profileRepo;

  ProfileUseCaseRepoImpl(this.profileRepo);

  @override
  Future<Result<GetUserInfoEntity?>> getUserInfo(
    GetUserInfoRequest getUserInfoRequest,
  ) {
    return profileRepo.getUserInfo(getUserInfoRequest);
  }

  @override
  Future<Result<EditProfileEntity?>> editProfile(EditProfileRequest editProfileRequest) {
   return profileRepo.editProfile(editProfileRequest);
  }
}
