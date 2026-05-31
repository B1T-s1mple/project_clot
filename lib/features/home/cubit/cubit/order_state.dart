
import 'package:scot/features/home/models/order_model.dart';

abstract class OrderState {
  const OrderState();
}

class Ordersinitial extends OrderState {
  const Ordersinitial();
}

class OrdersLoading extends OrderState {
   OrdersLoading();
}

class OrdersError extends OrderState {
  final String message;
  const OrdersError(this.message);
}

class OrdersLoaded extends OrderState {
  final List<OrderModel> orders;
  const OrdersLoaded(this.orders);
}
