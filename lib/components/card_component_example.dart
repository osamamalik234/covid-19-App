import 'package:flutter/material.dart';

class CardComponentExample extends StatelessWidget {
  final String text;
  final String myImage;
  const CardComponentExample({Key? key, required this.text, required this.myImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          image: AssetImage(
            myImage,
          ),
          fit: BoxFit.cover,
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.white.withOpacity(0.5),
        //     spreadRadius: 2,
        //     blurRadius: 2,
        //   ),
        // ],
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff373635),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold, letterSpacing: 2),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
