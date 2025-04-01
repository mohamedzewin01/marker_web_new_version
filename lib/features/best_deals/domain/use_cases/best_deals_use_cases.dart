import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/features/best_deals/domain/entities/best_deals_by_categories_entity.dart';
import 'package:fada_alhalij_web/features/best_deals/domain/repo/best_deals_repo.dart';

import 'package:injectable/injectable.dart';

@injectable
class BestDealsUseCases {
  final BestDealsRepo bestDealsRepo;

  BestDealsUseCases(this.bestDealsRepo);

  Future<Result<BestDealsByCategoriesEntity?>> getBestDealsByCategories() =>
      bestDealsRepo.getBestDealsByCategories();
}
