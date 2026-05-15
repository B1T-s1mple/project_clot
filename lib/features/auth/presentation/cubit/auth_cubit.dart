import 'package:bloc/bloc.dart';
import 'package:scot/features/auth/presentation/model/auth_model.dart';
import 'package:scot/features/auth/presentation/repo/auth_repo.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  AuthCubit(this.authRepo) : super(AuthInitial());

  Future<void> registerUser(RegisterRequest request) async {
    emit(AuthLoading());
    try {
      await authRepo.register(request);
      emit(AuthSuccess("Muvaffaqiyatli ro'yxatdan o'tdingiz!")); 
    } catch (e) {
      emit(AuthError(e.toString())); 
    }
  }

  Future<void> loginUser(LoginRequest request) async {
    emit(AuthLoading());
    try {
      await authRepo.login(request);
      emit(AuthSuccess("kidin euuu"));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}