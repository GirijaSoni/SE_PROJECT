import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:photochatapp/services/DatabaseService.dart';

class AuthenticationService {
  final auth.FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);

  Stream<auth.User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<bool> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on auth.FirebaseAuthException catch (e) {
      print(e.message);
      return false;
    }
  }

  Future<bool> signUp(
    String fname,
    String lname,
    String email,
    String password,
  ) async {
    try {
      var result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      auth.User user = result.user;
      await DatabaseService(uid: user.uid).updateUserData(fname, lname, email);
      return true;
    } on auth.FirebaseAuthException catch (e) {
      print(e.message);
      return false;
    }
  }
}
