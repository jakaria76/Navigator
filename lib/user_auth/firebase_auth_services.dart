



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService{

  FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signUpWithEmailAndPassword(String username,String email,String password) async{

    try{
      UserCredential credential=await _auth.createUserWithEmailAndPassword(email: email, password: password);
      credential.user!.updateDisplayName(username);

      await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
        "username": username,
        "email": email,
        "status": "Unavalible",
        "uid": _auth.currentUser!.uid,
      });
      return credential.user;
    }  on FirebaseAuthException catch(e){

      if(e.code == 'email-already-in-use'){
        print( 'The e-mail address is already in use');

      }else {
        print('An error occurred :${e.code}');
      }

    }


    return null;
  }

  Future<User?> signInWithEmailAndPassword(String email,String password) async{
    try{
      UserCredential credential =await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }catch(e){
      print('some error occured');
    }
    return null;
  }



}