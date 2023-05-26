import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/utils/flutter_toast.dart';

class SignUpController with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  final users = FirebaseFirestore.instance.collection('users');
  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  void signUp(BuildContext context , String username , String email , String password) {
    setLoading(true);
    try {
      auth.createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        users.add({
          "username": username,
          "email": email,
        });
        Utils().toastMessage("You have signed UP", Colors.yellow);
        setLoading(false);
      }).onError((error, stackTrace) {
        Utils().toastMessage(error.toString(), Colors.red);
        setLoading(false);
      });
    }
    catch (e) {
      Utils().toastMessage(e.toString(), Colors.red);
    }
  }}