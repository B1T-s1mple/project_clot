import 'package:bloc/bloc.dart';
import 'package:scot/features/settings/cubit/cubit_Address/get_adress_state.dart';
import 'package:scot/features/settings/presentation/repo/get_adres_repo.dart';

class GetAddressesCubit extends Cubit<GetAddressesState> {
  final GetAdresRepo repo;

  GetAddressesCubit(this.repo) : super(GetAddressesInitial());

  Future<void> fetchAddresses() async {
    emit(GetAddressesLoading());
    try {
      final addresses = await repo.getAddresses();
      emit(GetAddressesSuccess(addresses));
    } catch (e) {
      emit(GetAddressesError(e.toString()));
    }
  }
}