

import 'package:dio/dio.dart';
import 'package:fada_alhalij_web/core/api/api_constants.dart';
import 'package:fada_alhalij_web/features/home/data/models/response/home_model_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'api_manager.g.dart';

@injectable
@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  @FactoryMethod()
  factory ApiService(Dio dio) = _ApiService;

  @POST(ApiConstants.home)
  Future<HomeModelResponseDto?> getHomeData();



  // @POST(ApiConstants.categories)
  // Future<CategoriesZoneResponse> getCategories(
  //     @Part(name: 'id_zone') int idZone);
}

//  @MultiPart()
