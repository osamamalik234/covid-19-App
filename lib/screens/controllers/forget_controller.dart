import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/utils/flutter_toast.dart';

class ForgetPasswordController with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void forget(String email) {
    setLoading(true);
    try {
      auth.sendPasswordResetEmail(email: email).then((value) {
        Utils().toastMessage(
            "Link has been sent, please your email", Colors.yellow);
        setLoading(false);
      }).onError((error, stackTrace) {
        Utils().toastMessage(error.toString(), Colors.red);
        setLoading(false);
      });
    } catch (e) {
      Utils().toastMessage(e.toString(), Colors.red);
      setLoading(false);
    }
  }
}
