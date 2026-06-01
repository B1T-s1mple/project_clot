
import 'package:scot/features/cart/model/products_model.dart';

abstract class CheckoutState {
  const CheckoutState();
}

class CheckoutInit extends CheckoutState {
  const CheckoutInit();
}

class CheckoutLoading extends CheckoutState {
  const CheckoutLoading();
}

class CheckoutError extends CheckoutState {
  final String message;
  const CheckoutError(this.message);
}

class CheckoutLoaded extends CheckoutState {
  final List<ProductModel> checkout;
  const CheckoutLoaded(this.checkout);
}
