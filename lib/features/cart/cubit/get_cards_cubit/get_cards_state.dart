import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scot/features/cart/cubit/get_cards_cubit/get_cards_cubit.dart';
import 'package:scot/features/cart/model/get_cards.dart';
import 'package:scot/features/cart/presentation/repo/getCards_repo.dart';

class GetCardsCubit extends Cubit<GetCardsState> {
  final GetcardsRepo repo;

  GetCardsCubit(this.repo) : super(GetCardsInitial());

  Future<void> getAllCards() async {
    emit(GetCardsLoading());

    try {
      final cards = await repo.getCards();

      emit(GetCardsLoaded(cards.cast<GetCards>()));
    } catch (e) {
      emit(GetCardsError(e.toString()));
    }
  }
}
