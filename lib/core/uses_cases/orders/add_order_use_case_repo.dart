

import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/features/order/data/models/request/add_order_request.dart';
import 'package:fada_alhalij_web/features/order/domain/entities/orders_entities.dart';

abstract class AddOrderUseCaseRepo {

  Future<Result<AddOrderEntity?>> addOrder(AddOrderRequest addOrderRequest);
}