import 'package:fada_alhalij_web/core/api/api_extentions.dart';
import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/features/home/domain/entities/home_entities.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_manager/api_manager.dart';
import 'home_data_source_repo.dart';

@Injectable(as: HomeDataSourceRepo)
class HomeDataSourceRepoImpl implements HomeDataSourceRepo {
  ApiService apiService;

  HomeDataSourceRepoImpl(this.apiService);

  @override
  Future<Result<HomeEntity?>> getHomeData(int idZone) {
    return executeApi(() async {
      var response = await apiService.getHomeData(idZone);
      return response.toHomeEntity();
    });
  }
}
