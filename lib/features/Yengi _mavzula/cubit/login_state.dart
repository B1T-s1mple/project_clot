import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  List<Object?> get props {
    return [];
  }
}

class FirebaseInitial extends LoginState {}

class FirebaseLoading extends LoginState {}

class FirebaseSuccess extends LoginState {
  final User user;
  const FirebaseSuccess({required this.user, });

  @override
  List<Object?> get props => [user];
}

class FirebaseError extends LoginState {
  final String message;

  const FirebaseError({required this.message});
   @override
  List<Object?> get props => [message];
}
