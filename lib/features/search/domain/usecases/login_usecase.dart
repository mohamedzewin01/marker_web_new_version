import '../repositories/search_repository.dart';

class LoginUseCase {
  final SearchRepository repository;

  LoginUseCase(this.repository);

  Future<void> call(String email, String password) {
    return repository.login(email, password);
  }
}
