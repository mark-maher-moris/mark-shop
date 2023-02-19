import 'package:firebase_auth/firebase_auth.dart';
import '/Pages/sign_in.dart';

class Auth {
  FirebaseAuth namozag = FirebaseAuth.instance;
//Creating account
  Future<UserCredential?> signUp(
      {required String emil, required String pass}) async {
    try {
      final authResult = await namozag.createUserWithEmailAndPassword(
          email: emil, password: pass);
      print(authResult.toString());
    } catch (e) {
      print(e.toString());
    }
  }

//Sign in exesting account
  Future<UserCredential?> signIn(
      {required String emil, required String pass}) async {
    try {
      final authResult =
          await namozag.signInWithEmailAndPassword(email: emil, password: pass);
    } catch (e) {
      e.toString();
    }
  }
}
