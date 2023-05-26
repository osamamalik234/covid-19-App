import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/screens/home_screen.dart';
import 'package:sample_project/utils/flutter_toast.dart';

class LoginController with ChangeNotifier {

  FirebaseAuth auth = FirebaseAuth.instance;
  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value){
      _loading = value;
      notifyListeners();
  }

  void login(BuildContext context , String email , String password){
    setLoading(true);
    try{
      auth.signInWithEmailAndPassword(email: email, password: password).then((value){
        Utils().toastMessage("You have logged in Successfully", Colors.yellow);
        setLoading(false);
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }).onError((error, stackTrace) {
         Utils().toastMessage(error.toString(), Colors.red);
         setLoading(false);
      });
    }catch(error){
      Utils().toastMessage(error.toString(), Colors.red);
      setLoading(false);
    }
  }



}