import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/features/order/data/data_sources/orders_data_sources_repo.dart';
import 'package:fada_alhalij_web/features/order/data/models/request/add_order_request.dart';
import 'package:fada_alhalij_web/features/order/domain/entities/orders_entities.dart';
import 'package:fada_alhalij_web/features/order/domain/repo/orders_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OrdersRepo)
class OrdersRepoImpl implements OrdersRepo {
  final OrdersDataSourcesRepo ordersDataSourcesRepo;

  OrdersRepoImpl(this.ordersDataSourcesRepo);

  @override
  Future<Result<AddOrderEntity?>> addOrder(AddOrderRequest addOrderRequest) {
    return ordersDataSourcesRepo.addOrder(addOrderRequest);
  }

  @override
  Future<Result<GetActiveOrdersEntity?>> getActiveOrders() {
return ordersDataSourcesRepo.getActiveOrders();
  }

  @override
  Future<Result<GetActiveOrdersEntity?>> getCompletedOrder() {
   return ordersDataSourcesRepo.getCompletedOrder();
  }
}
