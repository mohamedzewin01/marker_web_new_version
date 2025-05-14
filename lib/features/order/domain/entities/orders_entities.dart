

import 'package:fada_alhalij_web/features/order/data/models/response/add_order_dto.dart';
import 'package:fada_alhalij_web/features/order/data/models/response/get_active_orders_dto.dart';

class AddOrderEntity {

  final String? message;

  final Order? order;

  AddOrderEntity ({
    this.message,
    this.order,
  });

}

class GetActiveOrdersEntity {

  final String? message;

  final List<ActiveOrder>? orders;

  GetActiveOrdersEntity ({
    this.message,
    this.orders,
  });


}