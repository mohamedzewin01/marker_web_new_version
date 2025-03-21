import 'package:dio/dio.dart';
import 'package:fada_alhalij_web/features/categories/data/models/categories_zone_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../features/home/data/models/response/HomeModelResponseDto.dart';
import '../api_constants.dart';

part 'api_manager.g.dart';

@injectable
@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  @FactoryMethod()
  factory ApiService(Dio dio) = _ApiService;

  @POST(ApiConstants.home)
  Future<HomeModelResponseDto> getHomeData(@Part(name: 'id_zone') int idZone);

  @POST(ApiConstants.categories)
  Future<CategoriesZoneResponse> getCategories(
      @Part(name: 'id_zone') int idZone);
}

//  @MultiPart()
