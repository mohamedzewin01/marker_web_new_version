import 'package:dio/dio.dart';
import 'package:fada_alhalij_web/core/api/api_constants.dart';
import 'package:fada_alhalij_web/features/analytics/model/device_response.dart';
import 'package:fada_alhalij_web/features/best_deals/data/models/best_deals_by_categories_model.dart';
import 'package:fada_alhalij_web/features/best_deals/data/models/best_deals_by_discount.dart';
import 'package:fada_alhalij_web/features/categories/data/models/categories_zone_response.dart';
import 'package:fada_alhalij_web/features/home/data/models/response/home_model_response_dto.dart';
import 'package:fada_alhalij_web/features/products/data/models/products_model_response.dart';
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

  @POST(ApiConstants.categories)
  Future<CategoriesZoneResponse> getCategories();

  @POST(ApiConstants.fetchBestDealsByCate)
  Future<BestDealsByCategoriesModel?> getBestDealsByCategories();

  @POST(ApiConstants.fetchProductsByCategories)
  Future<ProductsModelResponse> getProductsByCategory(
    @Part(name: 'idCategory') String idCategory,
  );

  @POST(ApiConstants.addDevice)
  @MultiPart()
  Future <DeviceResponse>addDevice(
    @Part(name: 'deviceId') String? deviceId,
    @Part(name: 'deviceName') String? deviceName,
  );


  @POST(ApiConstants.productVisit)
  @MultiPart()
  Future <dynamic>addProductVisit(
      @Part(name: 'deviceId') int? deviceId,
      @Part(name: 'productId') int? productId,
      );

  @POST(ApiConstants.fetchBestDealsByDiscount)

  Future <BestDealsByDiscountDto?>fetchBestDealsByDiscount(
      @Part(name: 'discount') int? numDiscount,
      );

}

//  @MultiPart()
