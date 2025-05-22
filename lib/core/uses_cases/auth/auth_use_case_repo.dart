

import 'package:fada_alhalij_web/core/common/api_result.dart';

import 'package:fada_alhalij_web/features/auth/data/models/request/edit_profile_request.dart';
import 'package:fada_alhalij_web/features/auth/domain/entities/auth_entities.dart';

abstract class AuthUseCaseRepo {

  Future<Result<EditProfileEntity?>> editProfile(EditProfileRequest editProfileRequest);
}