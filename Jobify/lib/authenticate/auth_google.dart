import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthGoogle{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream<User?> get authChanges => _auth.authStateChanges();
  User get user => _auth.currentUser!;
  Future<bool> signInWithGoogle(BuildContext context) async{
   bool res = false; 
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn(); 
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential  = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken
      )
      ;

      UserCredential userCredential = await _auth.signInWithCredential(credential);
      User? user = userCredential.user;
      if(user != null){
        if(userCredential.additionalUserInfo!.isNewUser){
           await firestore.collection('users').doc(user.uid).set({
            'username': user.displayName,
            'uid': user.uid,
            'profilePic': user.photoURL
           }
           );
        }
        res = true;
      }
    }on FirebaseAuthException catch (e) {
      print(e.message);
    }
    return res;
}

void signout() async{
  try {
    
  await _auth.signOut();
  } catch (e) {
    print(e);
  }

}
}
