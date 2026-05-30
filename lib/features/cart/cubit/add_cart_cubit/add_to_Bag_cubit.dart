import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scot/features/cart/cubit/add_cart_cubit/add_to_Bag_state.dart';
import 'package:scot/features/cart/presentation/repo/add_to_Bag_repo.dart';

class AddToBagCubit extends Cubit<AddtoBagState> {
  final AddToBagRepo repo;
  AddToBagCubit({required this.repo}) : super(const AddtoBagtInit());

Future<void> addToBag({
  required int productId,
  required String color,
  required String size,
  required int quantity,
}) async {
  emit(const AddtoBagLoading());

  try {
    await repo.addToBag(
      productId: productId,
      color: color,
      size: size,
      quantity: quantity,
    );
    
    emit(const AddtoBagtInit()); 
  } catch (e) {
    emit(AddtoBagError(e.toString()));
  }
}
}
