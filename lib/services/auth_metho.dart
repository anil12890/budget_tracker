import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/Transcations.dart';
import '../model/getUserProfile.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Usermodel> getUserDetail() async {
    final DocumentSnapshot snapshot =
    await _firestore.collection('users').doc(_auth.currentUser!.uid).get();
    return Usermodel.fromJson(snapshot);
  }

Future<List<UserData>> getTranscation()
async{
    final List<UserData> transcationList = [];


    final QuerySnapshot snapshot =await _firestore.collection('users').doc(_auth.currentUser!.uid).collection('Transcations').get();
    Map<String,dynamic> ?data;

    for(DocumentSnapshot doc in snapshot.docs)
    {
      final snap =   doc.data() as Map<String,dynamic>;
      UserData transcation = UserData.fromJson(snap);
      transcationList.add(transcation);

    }
    return transcationList;

}

   Future<String> signUpUser({required String email,
      required String password,
      required String FirstName,
      required String LastName,
      Uint8List? file}) async {
      String res = "Some error occurred ";
      try {
        if (email.isNotEmpty ||
            password.isNotEmpty ||
            FirstName.isNotEmpty ||
            LastName.isNotEmpty) {
          UserCredential cred = await _auth.createUserWithEmailAndPassword(
              email: email, password: password);
          Usermodel model = Usermodel(
            email: email,
            password: password,
            FirstName: FirstName,
            LastName: LastName,
          );

          await _firestore
              .collection('users')
              .doc(cred.user!.uid)
              .set(model.toJson());
          res = 'Sucess';
          //add user to database
        }
      } catch (error) {
        res = error.toString();
      }
      return res;
    }

    Future<String> Login(
        {required String email, required String password}) async {
      String res = "Some error occurred";
      try {
        if (email.isNotEmpty || password.isNotEmpty) {
          final UserCredential res = await _auth.signInWithEmailAndPassword(
              email: email, password: password);
        }
        res = 'Sucess';
      } catch (error) {
        res = error.toString();
      }
      return res;
    }
  }

