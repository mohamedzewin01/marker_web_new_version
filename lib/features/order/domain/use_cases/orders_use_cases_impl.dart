
import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/core/uses_cases/orders/add_order_use_case_repo.dart';
import 'package:fada_alhalij_web/features/order/data/models/request/add_order_request.dart';
import 'package:fada_alhalij_web/features/order/domain/entities/orders_entities.dart';
import 'package:fada_alhalij_web/features/order/domain/repo/orders_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddOrderUseCaseRepo)
class OrdersUseCasesImpl implements AddOrderUseCaseRepo {
  final OrdersRepo ordersRepo;

  OrdersUseCasesImpl(this.ordersRepo);

  @override
  Future<Result<AddOrderEntity?>> addOrder(AddOrderRequest addOrderRequest) {
   return ordersRepo.addOrder(addOrderRequest);
  }

  @override
  Future<Result<GetActiveOrdersEntity?>> getActiveOrders() {
  return ordersRepo.getActiveOrders();
  }

  @override
  Future<Result<GetActiveOrdersEntity?>> getCompletedOrder() {
return ordersRepo.getCompletedOrder();
  }

}