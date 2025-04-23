import 'package:fada_alhalij_web/features/best_deals/data/models/best_deals_by_categories_model.dart';
import 'package:fada_alhalij_web/features/best_deals/data/models/best_deals_by_discount.dart';

class BestDealsByCategoriesEntity {
  BestDealsByCategoriesEntity({
    this.categoryList,});


  List<CategoryList>? categoryList;



}

class BestDealsByDiscountEntity {
  BestDealsByDiscountEntity({
    this.status,
    this.bestDeals,});


  String? status;
  List<BestDeals>? bestDeals;



}