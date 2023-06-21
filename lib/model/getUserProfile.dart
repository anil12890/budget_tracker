import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';

class Usermodel{
  final String ?email;
     final   String? password;
  final  String ?FirstName;
  final String ?LastName;
  final Uint8List? file;
  Usermodel({required this.email,required this.password,required this.FirstName,required this.LastName,this.file});

  Map<String,dynamic> toJson()
  {
    return {
      'email': email,
      'password':password,
      'FirstName':FirstName,
      'LastName':LastName,

    };


  }
 static Usermodel fromJson(DocumentSnapshot snapshot)
  {
    final snap = snapshot.data() as Map<String,dynamic>;
    return Usermodel(
      email:snap['email'] ?? null,
      password:snap['password'] ?? null,
      FirstName: snap['FirstName'] ?? null,
      LastName:snap['LastName'] ?? null,
    );
  }



}