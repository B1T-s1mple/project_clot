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
      final user = await authRepo.register(request);
      emit(Signup(user.id));
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

  Future<void> completeUserProfile({
    required int userId,
    required AgePrifile request,
  }) async {
    emit(AuthLoading());
    try {
      await authRepo.completeProfile(userId: userId, request: request);
      emit(AuthSuccess("yoshini endi bilama"));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
