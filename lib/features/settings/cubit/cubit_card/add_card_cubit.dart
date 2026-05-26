import 'package:bloc/bloc.dart';
import 'package:scot/features/auth/presentation/model/auth_model.dart';
import 'package:scot/features/settings/cubit/cubit_card/add_card_state.dart';
import 'package:scot/features/settings/presentation/repo/card_repo.dart';

class AddCardCubit extends Cubit<AddCardState> {
  AddCardCubit(this.repo) : super(Addcardinitial());
  final Cardrepo repo;
  Future<void> addcard(CardModel request) async {
    emit(Addcardloading());
    try {
      await repo.addcard(request );
      emit(AddcardSucces("kidin euuu"));
    } catch (e) {
      emit(AddcardError(e.toString()));
    }
  }
}
