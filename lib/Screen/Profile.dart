import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';

import '../model/getUserProfile.dart';
import '../services/auth_metho.dart';
import '../utils/utils.dart';

class HomeProfile extends StatefulWidget {
  const HomeProfile({Key? key}) : super(key: key);

  @override
  State<HomeProfile> createState() => _HomeProfileState();
}

class _HomeProfileState extends State<HomeProfile> {
  @override
  Future<Usermodel?> ?userFuture;

  Future<Usermodel?> getUser()
  async{
    AuthMethods authMethods = AuthMethods();
    try{
      Usermodel ?user;
      user = await  authMethods. getUserDetail();
      print('Email: ${user!.email}');
      print('FirstName:${user!.FirstName}');
      print('LastName:${user!.LastName}');
      return user;
    }catch(e)
    {
      print('Error fetching user data:$e');
      return null;
    }


  }
  void initState()
  {
    userFuture = getUser();
  }


  @override
  Widget build(BuildContext context) {
    // Usermodel user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(

      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child:FutureBuilder<Usermodel?>
            (future:userFuture,
          builder:(context,snapshot)
          {
            if(snapshot.connectionState ==ConnectionState.waiting)
              {
                return Center(child: CircularProgressIndicator(color:Colors.cyan));
              }else if(snapshot.hasError)
                {
                  return Text('Error :${snapshot.error}');
                }else
                  {
                    Usermodel ? user = snapshot.data;
                    if(user!= null)
                      {
                        return  Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_back_ios_new_outlined),
                              color: Colors.black38,
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              color: Colors.black38,
                              icon: const Icon(Icons.settings),
                            )
                          ]),
                          SizedBox(height: 30),
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 60,
                                backgroundImage: AssetImage('assets/images/avatar.jpeg'),
                              ),
                              Positioned(
                                top: 80,
                                bottom: 0,
                                right: 0,
                                child: IconButton(
                                    iconSize: 30,
                                    onPressed: () {},
                                    icon: Icon(Icons.camera_alt)),
                              )
                            ],
                          ),
                          Text('${user!.FirstName} ${user!.LastName}',
                              style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          Text('${user!.email}',
                              style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          TextButton(
                            onPressed: () {},
                            child: Text('EditProfile',
                                style: TextStyle(color: Colors.greenAccent)),
                          )
                        ]);
                      }else
                        {
                          return Text('USer data not available');
                        }
                  }
          })





        ),
      ),
    );
  }
}
