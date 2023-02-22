import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    try{
      final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;

    _user = googleUser;

    final googlAuth = await googleUser.authentication;

    final credentials = GoogleAuthProvider.credential(
      accessToken: googlAuth.accessToken,
      idToken: googlAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credentials);

    notifyListeners();
    } catch (error){
      debugPrint('google signup error: ${error.toString()}');
    }
  }
}