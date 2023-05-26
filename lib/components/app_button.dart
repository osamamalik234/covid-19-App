import 'package:flutter/material.dart';
import 'package:sample_project/screens/login_screen.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final bool isLoading;
  const AppButton({Key? key, required this.text, required this.onPress , this.isLoading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.yellow.withOpacity(0.8),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Center(
          child: isLoading ? CircularProgressIndicator(color: Colors.black,) : Text(text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ,color: Colors.white),),
        ),
      ),
    );
  }
}
