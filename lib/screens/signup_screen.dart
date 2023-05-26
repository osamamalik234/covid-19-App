import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_project/components/app_button.dart';
import 'package:sample_project/components/text_field_component.dart';
import 'package:sample_project/screens/controllers/signup_controller.dart';
import 'package:sample_project/screens/login_screen.dart';
import 'package:sample_project/utils/flutter_toast.dart';
import 'package:sample_project/views/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            "SignUp Screen",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
        ),
        body: ChangeNotifierProvider(
          create: (_) => SignUpController(),
          child:
              Consumer<SignUpController>(builder: (context, provider, child) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('asset/signupImage.jpg'),
                        radius: 100,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFieldComponent(
                        controller: _usernameController,
                        labelText: "Username",
                        iconData: Icons.person_rounded),
                    SizedBox(
                      height: 10,
                    ),
                    TextFieldComponent(
                        controller: _emailController,
                        labelText: "Enter Email",
                        iconData: Icons.email),
                    SizedBox(
                      height: 10,
                    ),
                    TextFieldComponent(
                      controller: _passwordController,
                      labelText: "Enter Password",
                      iconData: Icons.lock,
                      suffixIcon: Icons.remove_red_eye,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    AppButton(
                      text: "Sign Up",
                      isLoading: provider.loading,
                      onPress: () {
                        if (_usernameController.text.trim().isEmpty &&
                            _emailController.text.trim().isEmpty &&
                            _passwordController.text.trim().isEmpty) {
                          Utils().toastMessage(
                              "Please fill all Details", Colors.red);
                        } else if (_usernameController.text.trim().isEmpty) {
                          Utils().toastMessage(
                              "Please Enter username", Colors.red);
                        } else if (_emailController.text.trim().isEmpty) {
                          Utils()
                              .toastMessage("Please Enter Email", Colors.red);
                        } else if (_passwordController.text.trim().isEmpty) {
                          Utils().toastMessage(
                              "Please Enter password", Colors.red);
                        } else {
                          provider.signUp(
                              context,
                              _usernameController.text.toString(),
                              _emailController.text.toString(),
                              _passwordController.text.toString());
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Already have an account? ",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ));
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.yellow,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
        ));
  }
}
