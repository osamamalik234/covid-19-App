import 'package:flutter/material.dart';
import 'package:sample_project/screens/login_screen.dart';
import 'package:sample_project/views/login_screen.dart';
import 'package:sample_project/views/starter_screen.dart';

class StarterScreen extends StatelessWidget {
  const StarterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Image.asset('asset/starterImage.png'),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 400,
                  height: 300,
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        "Welcome to our App",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 50, right: 50),
                        child: Text(
                          "This App helps you to register yourself ",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      const Text(
                        'and get nominated!',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 70, right: 70),
                          child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Center(
                              child: Text(
                                "Get Started",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
