import 'package:bloc/bloc.dart';
import 'package:scot/features/settings/cubit/cubit_card/get_card_state.dart';
import 'package:scot/features/settings/presentation/repo/get_card_repo.dart';

class GetCardCubit extends Cubit<GetCardState> {
  final GetCardRepo repo;

  GetCardCubit(this.repo,  ) : super(GetcardInitial());

  Future<void> getcards() async {
    emit(GetcardLoading());
    try {
      final addresses = await repo.getcard();
      emit(Getcardsucces(addresses));
    } catch (e) {
      emit(GetcardError(e.toString()));
    }
  }
}