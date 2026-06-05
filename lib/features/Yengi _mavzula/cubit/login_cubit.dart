import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scot/features/Yengi%20_mavzula/cubit/login_state.dart';
import 'package:scot/features/Yengi%20_mavzula/repo/firebase_auth_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  final FirebaseAuthRepo repo;
  LoginCubit({required this.repo}) : super(FirebaseInitial());

  Future<void> signUp({required String email, required String password}) async {
    emit(FirebaseLoading());
    try {
      final creads = await repo.signUp(email: email, password: password);
      emit(FirebaseSuccess(user: creads.user!));
    } catch (e) {
      emit(FirebaseError(message: e.toString()));
    }
  }


    Future<void> signIn({required String email, required String password}) async {
    emit(FirebaseLoading());
    try {
      final creads = await repo.signIn(email: email, password: password);
      emit(FirebaseSuccess(user: creads.user!));
    } catch (e) {
      emit(FirebaseError(message: e.toString()));
    }
  }
}
