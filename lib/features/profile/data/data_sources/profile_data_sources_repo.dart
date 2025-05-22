
import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/features/auth/data/models/request/edit_profile_request.dart';
import 'package:fada_alhalij_web/features/auth/domain/entities/auth_entities.dart';
import 'package:fada_alhalij_web/features/profile/data/models/request/get_user_info_request.dart';
import 'package:fada_alhalij_web/features/profile/domain/entities/profile_entities.dart';

abstract class ProfileDataSourcesRepo {
  Future<Result<GetUserInfoEntity?>>getUserInfo(GetUserInfoRequest getUserInfoRequest);
  Future<Result<EditProfileEntity?>> editProfile(EditProfileRequest editProfileRequest);
}