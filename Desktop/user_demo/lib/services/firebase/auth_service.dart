import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithEmailAndPassword(
      String email,
      String password,
      Function(String e) onException,
      Function(UserCredential? user) onUser) async {
    UserCredential? user;
    try {
      user = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      user = null;
      onException(e.code);
    }
    onUser(user);
  }

  Future<void> createUserWithEmailAndPassword(
      String email,
      String password,
      Function(String e) onException,
      Function(UserCredential? user) onUser) async {
    UserCredential? user;
    try {
      user = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException: ${e.code}");
      user = null;
      onException(e.code);
    }
    onUser(user);
  }

  static Future<void> sendEmailPasswordReset(String email,
      Function(Object e) onException, Function(bool s) onDone) async {
    bool sent = true;
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      onException(e.code);
      sent = false;
    }

    onDone(sent);
  }

  Future<void> signOut(
      Function(Object e) onException, Function() onSignOut) async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      onException(e);
    }
    onSignOut();
  }
}
