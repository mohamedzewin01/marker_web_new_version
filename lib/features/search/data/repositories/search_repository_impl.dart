import '../../domain/repositories/search_repository.dart';
import '../datasources/search_remote_data_source.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource remoteDataSource;

  SearchRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> login(String email, String password) {
    return remoteDataSource.login(email, password);
  }
}
