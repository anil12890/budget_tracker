import 'package:flutter/material.dart';
import 'package:money_banking/LoginScreen/RegisterScreen.dart';
import 'package:money_banking/Screen/Profile.dart';
import 'package:money_banking/Screen/Wallet.dart';
import 'package:money_banking/widget/TextFieldInput.dart';

import '../Screen/HomeScreen.dart';
import '../Screen/MainScreenHost.dart';
import '../services/auth_metho.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    String res = await AuthMethods().Login(
        email: _emailController.text, password: _passwordController.text);
    print(res);
    if (res == 'Sucess') {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MainScreenHost()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0x000000),
        body: SafeArea(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(child: Container(), flex: 2),
                    Text("Budget Tracker",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withOpacity(0.8))),
                    TextFieldInput(
                      textEditingController: _emailController,
                      hintText: "Enter your email",
                      TextInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 20),
                    TextFieldInput(
                      textEditingController: _passwordController,
                      hintText: "Password",
                      isPass: true,
                      TextInputType: TextInputType.text,
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: loginUser,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 45,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text("LoginScreen")),
                    ),
                    Spacer(),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text('Do you what to signUp ',
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.8))),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()));
                        },
                        child: Text('SignUp'),
                      ),
                    ]),
                  ])),
        ));
  }
}
