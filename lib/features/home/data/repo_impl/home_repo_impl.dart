import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/features/home/data/data_sources/home_data_source_repo.dart';
import 'package:fada_alhalij_web/features/home/domain/entities/home_entities.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo/home_repo.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  HomeDataSourceRepo homeDataSourceRepo;

  HomeRepoImpl(this.homeDataSourceRepo);

  @override
  Future<Result<HomeEntity?>> getHomeData(int idZone) {
    return homeDataSourceRepo.getHomeData(idZone);
  }
}
