import 'package:scot/features/cart/model/get_cards.dart';


abstract class GetCardsState {}

class GetCardsInitial extends GetCardsState {}
class GetCardsLoading extends GetCardsState {}

class GetCardsLoaded extends GetCardsState {
  final List<GetCards> cards;
  GetCardsLoaded(this.cards);
}

class GetCardsError extends GetCardsState {
  final String message;
  GetCardsError(this.message);
}