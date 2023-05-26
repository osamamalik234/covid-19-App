// import 'package:flutter/material.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   bool _obscureText = false;
//   final _emailController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text(
//           "Login Screen",
//           style: TextStyle(color: Colors.black),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         elevation: 0.0,
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Padding(
//               padding: EdgeInsets.only(left: 10),
//               child: Icon(
//                 Icons.arrow_back_ios,
//                 color: Colors.black,
//                 size: 30,
//               ),
//             )),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(
//             children: [
//               Image.asset('asset/loginImage.png'),
//               const SizedBox(
//                 height: 40,
//               ),
//               TextFormField(
//                 // controller: _emailController,
//                 decoration: InputDecoration(
//                   hintText: 'Email',
//                   prefixIcon: const Icon(
//                     Icons.email,
//                     color: Colors.orange,
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: const BorderSide(color: Colors.orange),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: const BorderSide(color: Colors.orange),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               TextFormField(
//                 controller: _emailController,
//                 obscureText: _obscureText,
//                 decoration: InputDecoration(
//                   hintText: 'Password',
//                   prefixIcon: const Icon(
//                     Icons.lock,
//                     color: Colors.orange,
//                   ),
//                   suffixIcon:  GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         _obscureText = !_obscureText;
//                       });
//                     },
//                     child: Icon(_obscureText ? Icons.visibility_off : Icons.visibility , color: Colors.orange,),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: const BorderSide(color: Colors.orange),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: const BorderSide(color: Colors.orange),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               SizedBox(
//                 height: 50,
//                 width: 150,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.orange,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30.0),
//                     ),
//                   ),
//                   child: const Text(
//                     'Login',
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 40,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     "Please create an account?",
//                     style: TextStyle(fontSize: 18),
//                   ),
//                   TextButton(
//                       onPressed: () {},
//                       child: const Text(
//                         "Sign Up",
//                         style: TextStyle(
//                             color: Colors.orange,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                             decoration: TextDecoration.underline),
//                       ),),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
