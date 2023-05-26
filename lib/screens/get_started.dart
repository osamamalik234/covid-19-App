import 'package:flutter/material.dart';
import 'package:sample_project/screens/login_screen.dart';
import 'package:sample_project/components/app_button.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('asset/food1.jpg'),
            Column(
              children: <Widget>[
                Text(
                  "Food App",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "Contrary to popular belief, Lorem Ipsum "
                    "is not simply random text."
                    " It has roots in a piece of"
                    " classical Latin Literature from.",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "SKIP",
                      style: TextStyle(
                          color: Colors.grey, fontSize: 20, letterSpacing: 3),
                    )),
                AppButton(
                  text: "Get Started",
                  isLoading: false,
                  onPress: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
