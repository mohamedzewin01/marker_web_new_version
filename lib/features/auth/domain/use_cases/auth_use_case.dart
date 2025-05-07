import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/features/auth/data/models/request/auth_signin_request.dart';
import 'package:fada_alhalij_web/features/auth/data/models/request/auth_signup_request.dart';
import 'package:fada_alhalij_web/features/auth/domain/entities/auth_entities.dart';
import 'package:fada_alhalij_web/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthUseCase {
  final AuthRepo _authRepo;

  AuthUseCase(this._authRepo);

  Future<Result<AuthSignupEntity?>> signup(
    AuthSignupRequest authSignupRequest,
  ) => _authRepo.signup(authSignupRequest);

  Future<Result<AuthSingInEntity?>> signIn(
    AuthSignInRequest authSignInRequest,
  ) => _authRepo.signIn(authSignInRequest);
}
