import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/features/home/domain/entities/home_entities.dart';

abstract class HomeDataSourceRepo {
  Future<Result<HomeEntity?>> getHomeData();
}
