import 'package:bloc/bloc.dart';
import 'package:scot/features/settings/cubit/cubit_Address/addadres_state.dart';
import 'package:scot/features/settings/model/add_adress_model.dart';
import 'package:scot/features/settings/presentation/repo/adres_repo.dart';

class AddadresCubit extends Cubit<AddadresState> {
  AddadresCubit(this.repo) : super(Addadresinittial());
  final AddressRepo repo;
  Future<void> adadres(AddAdressModel request) async {
    emit(AddadresLoadind());
    try {
      await repo.addAddress(request);
      emit(AddadresSucces("kidin euuu"));
    } catch (e) {
      emit(AddadresError(e.toString()));
    }
  }
}
