import 'package:fada_alhalij_web/core/api/api_extentions.dart';
import 'package:fada_alhalij_web/core/api/api_manager/api_manager.dart';
import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/features/order/data/data_sources/orders_data_sources_repo.dart';
import 'package:fada_alhalij_web/features/order/data/models/request/add_order_request.dart';
import 'package:fada_alhalij_web/features/order/domain/entities/orders_entities.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OrdersDataSourcesRepo)
class OrdersDataSourcesRepoImpl implements OrdersDataSourcesRepo {
  final ApiService apiService;

  OrdersDataSourcesRepoImpl(this.apiService);

  @override
  Future<Result<AddOrderEntity?>> addOrder(AddOrderRequest addOrderRequest) {
    return executeApi(() async {
      var response = await apiService.addOrder(addOrderRequest);
      return response?.toAddOrderEntity();
    });
  }
}
