import 'package:bloc/bloc.dart';
import 'package:scot/features/settings/cubit/cubit_profil/profil_state.dart';
import 'package:scot/features/settings/presentation/repo/profil_repo.dart';

class ProfilCubit extends Cubit<ProfilState> {
  ProfilCubit(this.repo) : super(const ProfilInit());
  final ProfilRepo repo;
Future<void> getinfo() async {
  emit(const ProfilLoading());
  try {
    final profilInfo = await repo.getInfoProfile();
    
    emit(ProfilLoaded(profileInfolar: [profilInfo])); 
  } catch (e) {
    emit(ProfilError(e.toString()));
  }
}
}
