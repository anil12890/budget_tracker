import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/Transcations.dart';
import '../services/auth_metho.dart';

class Ammount{

   getExpenses()
  async {
    final List<String> ExpensesAmmount = [];


    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    FirebaseAuth _auth = FirebaseAuth.instance;
    final DocumentSnapshot snapshot=  await _firestore.collection('users').doc(_auth.currentUser!.uid).collection('Transcation').doc().get();
    final data = snapshot.data() as Map<String,dynamic>;
   print( data['income']);

  }

}