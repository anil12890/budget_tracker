import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../services/auth_metho.dart';
import '../utils/utils.dart';
import '../widget/TextFieldInput.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  AuthMethods methods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _FirstNameController = TextEditingController();
    final TextEditingController _LastNameController = TextEditingController();

    Uint8List? image;
    void selectedImage() async {
      final im = await getPicture(ImageSource.gallery);
      setState(() {
        image = im;
      });
    }

    @override
    @override
    void dispose() {
      // Add code before the super
      super.dispose();
      _emailController.dispose();
      _passwordController.dispose();
      _FirstNameController.dispose();
      _LastNameController.dispose();
    }

    return Scaffold(
      backgroundColor: Color(0x000000),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(children: [
                Text("Budget Tracker",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.8))),
                const SizedBox(height: 50),
                Stack(children: [
                  image!=null?CircleAvatar(radius:64,
                  backgroundImage:MemoryImage(image!)): const CircleAvatar(
                      radius: 60,
                      backgroundImage:
                      AssetImage('assets/images/avatar.jpeg')),
                  Positioned(
                      top: 80,
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                          iconSize: 30,
                          color: Colors.black,
                          onPressed: () {
                            selectedImage();
                          },
                          icon: Icon(Icons.camera_alt_sharp)))
                ]),
                SizedBox(height: 10),
                TextFieldInput(
                  textEditingController: _FirstNameController,
                  hintText: "First Name",
                  TextInputType: TextInputType.text,
                ),
                const SizedBox(height: 10),
                TextFieldInput(
                  textEditingController: _LastNameController,
                  hintText: "Last Name",
                  TextInputType: TextInputType.text,
                ),
                const SizedBox(height: 10),
                TextFieldInput(
                  textEditingController: _emailController,
                  hintText: "Enter your email",
                  TextInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 10),
                TextFieldInput(
                  textEditingController: _passwordController,
                  hintText: "Password",
                  isPass: true,
                  TextInputType: TextInputType.text,
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () async {
                    String res = await methods.signUpUser(
                        email: _emailController.text,
                        password: _passwordController.text,
                        FirstName: _FirstNameController.text,
                        LastName: _LastNameController.text);
                    print(res);

                    // Navigate back
                    Navigator.pop(context);
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text('SignUp')),
                ),
              ])),
        ),
      ),
    );
  }
}
