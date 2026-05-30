
import 'package:scot/features/cart/model/products_model.dart';

abstract class AddtoBagState {
  const AddtoBagState();
}

class AddtoBagtInit extends AddtoBagState {
  const AddtoBagtInit();
}

class AddtoBagLoading extends AddtoBagState {
  const AddtoBagLoading();
}

class AddtoBagError extends AddtoBagState {
  final String message;
  const AddtoBagError(this.message);
}

class AddtoBagLoaded extends AddtoBagState {
  final List<ProductModel> addcarts;
  const AddtoBagLoaded(this.addcarts);
}
