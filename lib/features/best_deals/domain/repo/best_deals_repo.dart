



import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/features/best_deals/domain/entities/best_deals_by_categories_entity.dart';


abstract class BestDealsRepo {
  Future<Result<BestDealsByCategoriesEntity?>> getBestDealsByCategories();
  Future<Result<BestDealsByDiscountEntity?>> getBestDealsByDiscount(int? discount);
  Future<Result<FetchBestDealsEntity?>> getAllBestDeals();
}