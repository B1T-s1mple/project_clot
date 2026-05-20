import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scot/features/cart/cubit/product_cubit_state.dart';
import 'package:scot/features/cart/presentation/repo/product_repo.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductsRepo repo;
  ProductCubit({required this.repo}) : super(ProductInit());

  Future<void> getProducts() async {
    emit(const ProductsLoading());

    try {
      final products = await repo.getProducts();

      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
