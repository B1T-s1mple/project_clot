import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scot/features/home/cubit/cubit/order_state.dart';
import 'package:scot/features/home/repo/orders_repo.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrdersRepo repo;
  OrderCubit({required this.repo}) : super(const Ordersinitial());
Future<void> getOrders() async {
  emit(OrdersLoading());

  try {
    final orders = await repo.getorders();

    emit(OrdersLoaded(orders)); 
  } catch (e) {
    emit(OrdersError(e.toString()));
  }
}
}
