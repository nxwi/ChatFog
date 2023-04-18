import 'package:chatfog/ui/home.dart';
import 'package:chatfog/ui/login.dart';
import "package:firebase_auth/firebase_auth.dart";

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  signinWithGoogle(context) async {
    GoogleSignInAccount? googletuser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleauth = await googletuser?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleauth?.accessToken, idToken: googleauth?.idToken);

    UserCredential usercredntial =
        await FirebaseAuth.instance.signInWithCredential(credential);

    print('successfully logedin ${usercredntial.user?.displayName}');

    if (usercredntial.user != null) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text("has Error ${snapshot.error}");
          }
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data == null) {
              return LoginPage();
            } else {
              return HomePage();
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  // signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser =
  //       await GoogleSignIn(scopes: <String>["email"]).signIn();

  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication googleAuth =
  //       await googleUser!.authentication;

  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );

  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }

  signOut(context) async {
    await GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
