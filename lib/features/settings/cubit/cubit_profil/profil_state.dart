
import 'package:scot/features/settings/model/profil_model.dart';

abstract class ProfilState {
  const ProfilState();
}

class ProfilInit extends ProfilState {
  const ProfilInit();
}

class ProfilLoading extends ProfilState {
  const ProfilLoading();
}

class ProfilError extends ProfilState {
  final String message;
  const ProfilError(this.message);
}

class ProfilLoaded extends ProfilState {
  final List<ProfilModel> profileInfolar;
  const ProfilLoaded({required this.profileInfolar});
}
