


import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/features/best_deals/data/data_sources/best_deals_data_sources.dart';
import 'package:fada_alhalij_web/features/best_deals/domain/entities/best_deals_by_categories_entity.dart';
import 'package:fada_alhalij_web/features/best_deals/domain/repo/best_deals_repo.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: BestDealsRepo)
 class BestDealsRepoImpl implements BestDealsRepo {
  BestDealsDataSources bestDealsDataSources;

  BestDealsRepoImpl(this.bestDealsDataSources);

  @override
  Future<Result<BestDealsByCategoriesEntity?>> getBestDealsByCategories() {
    return bestDealsDataSources.getBestDealsByCategories();
  }

}