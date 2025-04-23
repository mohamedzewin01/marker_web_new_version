import 'package:fada_alhalij_web/core/api/api_extentions.dart';
import 'package:fada_alhalij_web/core/api/api_manager/api_manager.dart';
import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/features/best_deals/domain/entities/best_deals_by_categories_entity.dart';

import 'package:injectable/injectable.dart';

@injectable
class BestDealsDataSources {
  ApiService apiService;

  BestDealsDataSources(this.apiService);

  Future<Result<BestDealsByCategoriesEntity?>> getBestDealsByCategories() {
    return executeApi(() async {
      var response = await apiService.getBestDealsByCategories();
      return response?.toBestDealsByCategoriesEntity();
    });
  }
  Future<Result<BestDealsByDiscountEntity?>> getBestDealsByDiscount(int? discount) {
    return executeApi(() async {
      var response = await apiService.fetchBestDealsByDiscount(discount);
      return response?.toBestDealsByDiscountEntity();
    });
    
  }

}
