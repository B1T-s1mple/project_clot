import 'package:bloc/bloc.dart';
import 'package:scot/features/settings/cubit/cubit_card/get_card_state.dart';
import 'package:scot/features/settings/presentation/repo/get_adres_repo.dart';

class GetCardCubit extends Cubit<GetCardState> {
  final GetAdresRepo repo;

  GetCardCubit(this.repo) : super(GetcardInitial());

  Future<void> getcards() async {
    emit(GetcardLoading());
    try {
      final addresses = await repo.getAddresses();
      emit(Getcardsucces(addresses));
    } catch (e) {
      emit(GetcardError(e.toString()));
    }
  }
}