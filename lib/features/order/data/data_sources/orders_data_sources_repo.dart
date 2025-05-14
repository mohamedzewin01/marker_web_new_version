


import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/features/order/data/models/request/add_order_request.dart';
import 'package:fada_alhalij_web/features/order/data/models/request/get_active_orders_request.dart';
import 'package:fada_alhalij_web/features/order/domain/entities/orders_entities.dart';

abstract class OrdersDataSourcesRepo {

  Future<Result<AddOrderEntity?>>addOrder(AddOrderRequest addOrderRequest);
  Future<Result<GetActiveOrdersEntity?>>getActiveOrders();
  Future<Result<GetActiveOrdersEntity?>>getCompletedOrder();
}


