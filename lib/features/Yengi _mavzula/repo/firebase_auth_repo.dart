import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepo {
  final FirebaseAuth _firebaseAuth;
  FirebaseAuthRepo({required FirebaseAuth firebaseAuth})
    : _firebaseAuth = firebaseAuth;
  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? "Error");
    } catch (e) {
      throw Exception(e);
    }
  }
    Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? "Error");
    } catch (e) {
      throw Exception(e);
    }
  }
}
