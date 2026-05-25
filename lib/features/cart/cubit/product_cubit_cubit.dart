import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scot/features/cart/cubit/product_cubit_state.dart';
import 'package:scot/features/cart/presentation/repo/product_repo.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductsRepo repo;
  ProductCubit({required this.repo}) : super(ProductInit());

  Future<void> getProducts({
    String? search,
    int? categoryId,
    String? gender,
    double? minPrice,
    double? maxPrice,
    bool? onSale,
    bool? freeShipping,
    String? sort,
  }) async {
    emit(const ProductsLoading());

    try {
      final products = await repo.getProducts(
        search: search,
        categoryId: categoryId,
        gender: gender,
        minPrice: minPrice,
        maxPrice: maxPrice,
        onSale: onSale,
        freeShipping: freeShipping,
        sort: sort
      );

      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
