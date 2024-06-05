import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:umla_assignment_app/screens/home_page.dart';
import 'package:umla_assignment_app/screens/login_page.dart';

class AuthServices{
  Future<UserCredential> signInWithGoogle({required BuildContext context}) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homepage()));
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }


  Future <void> signout({required BuildContext context})async {
    final signout= FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));

  }


}