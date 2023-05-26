import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_project/components/app_button.dart';
import 'package:sample_project/components/text_field_component.dart';
import 'package:sample_project/screens/controllers/forget_controller.dart';
import 'package:sample_project/utils/flutter_toast.dart';

class ForgetScreen extends StatelessWidget {
  const ForgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            "Forget Password",
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
          create: (_) => ForgetPasswordController(),
          child: Consumer<ForgetPasswordController>(
              builder: (context, provider, child) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Image.asset('asset/forgetImage.png'),
                    SizedBox(
                      height: 30,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text:
                                  "Please Type your Email to recover password,",
                              style: TextStyle(color: Colors.white)),
                          TextSpan(
                            text: "\n                               Thank You!",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextFieldComponent(
                      labelText: "Type Email",
                      iconData: Icons.email,
                      controller: _emailController,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    AppButton(
                      text: "Recover Password",
                      isLoading: provider.loading,
                      onPress: () {
                        if(_emailController.text.trim().isEmpty){
                          Utils().toastMessage("Please Enter Email", Colors.red);
                        }
                        else{
                          provider.forget(_emailController.text.toString());
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          }),
        ));
  }
}
