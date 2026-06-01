import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scot/features/cart/cubit/cubit/checkout_state.dart';
import 'package:scot/features/cart/model/products_model.dart';
import 'package:scot/features/cart/presentation/repo/checkout_repo.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final CheckoutRepo repo;
  CheckoutCubit({required this.repo}) : super(const CheckoutInit());

  Future<void> getProducts() async {
    emit(const CheckoutLoading());

    try {
      final products = await repo.getcardsANDadress();

      emit(CheckoutLoaded(products.cast<ProductModel>()));
    } catch (e) {
      emit(CheckoutError(e.toString()));
    }
  }
}
