import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_project/components/app_button.dart';
import 'package:sample_project/components/text_field_component.dart';
import 'package:sample_project/screens/controllers/login_controller.dart';
import 'package:sample_project/screens/forget_screen.dart';
import 'package:sample_project/screens/signup_screen.dart';
import 'package:sample_project/utils/flutter_toast.dart';
import 'package:sample_project/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Login Screen",
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
          ),
        ),
      ),
      body: ChangeNotifierProvider(
        create: (_) => LoginController(),
        child: Consumer<LoginController>(builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  Center(
                    child: CircleAvatar(
                      radius: 120,
                      backgroundImage: AssetImage('asset/login.jpg'),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFieldComponent(
                      controller: _emailController,
                      labelText: 'Enter Email',
                      iconData: Icons.email),
                  TextFieldComponent(
                      controller: _passwordController,
                      labelText: 'Enter Password',
                      iconData: Icons.lock,
                      suffixIcon: Icons.remove_red_eye),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgetScreen()));
                        },
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(
                            fontSize: 20,
                            decoration: TextDecoration.underline,
                            color: Colors.yellow,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  AppButton(
                    text: "Login",
                    isLoading: provider.loading,
                    onPress: () {
                      setState(() {
                        if (_emailController.text.trim().isEmpty &&
                            _passwordController.text.trim().isEmpty) {
                          Utils().toastMessage(
                              "Please Fill all the fields", Colors.red);
                        } else if (_emailController.text.trim().isEmpty) {
                          Utils().toastMessage(
                              "Please Enter your Email", Colors.red);
                        } else if (_passwordController.text.trim().isEmpty) {
                          Utils().toastMessage(
                              "Please Enter Password", Colors.red);
                        } else if (_passwordController.text.length < 6) {
                          Utils().toastMessage(
                              "Password Length should be greater than 6",
                              Colors.red);
                        } else {
                          provider.login(context, _emailController.text.toString(), _passwordController.text.toString());
                        }
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpScreen(),
                                ));
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.yellow,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
