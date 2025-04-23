// import 'dart:convert'; 
// import 'package:flutter/material.dart'; 
// import 'package:front_end/dashboard.dart'; 
// import 'package:front_end/registration.dart'; 
// import 'package:shared_preferences/shared_preferences.dart'; 
// import 'package:velocity_x/velocity_x.dart'; 
// import 'applogo.dart'; 
// import 'package:http/http.dart' as http; 
// import 'Config.dart'; 
 
// class SignInPage extends StatefulWidget { 
//   @override 
//   _SignInPageState createState() => _SignInPageState(); 
// } 
 
// class _SignInPageState extends State<SignInPage> { 
//   TextEditingController emailController = 
// TextEditingController(); 
//   TextEditingController passwordController = 
// TextEditingController(); 
//   bool _isNotValidate = false; 
//   late SharedPreferences prefs; 
//  @override 
//   void initState() { 
   
//     super.initState(); 
//     initSharedPref(); 
//   } 
 
//   void initSharedPref() async{ 
//     prefs = await SharedPreferences.getInstance(); 
//   } 
 
//   void loginUser() async{ 
//     if(emailController.text.isNotEmpty && 
// passwordController.text.isNotEmpty){ 
 
//       var reqBody = { 
//         "email":emailController.text, 
//         "password":passwordController.text 
//       };
//        var response = await http.post(Uri.parse(login), 
//           headers: {"Content-Type":"application/json"}, 
//           body: jsonEncode(reqBody) 
//       ); 
 
//       var jsonResponse = jsonDecode(response.body); 
//       if(jsonResponse['status']){ 
//           var myToken = jsonResponse['token']; 
//           prefs.setString('token', myToken); 
//           Navigator.push(context, MaterialPageRoute(builder: 
// (context)=>Dashboard(token: myToken))); 
//       }else{ 
//         print('Something went wrong'); 
//       } 
 
//     } 
//   } 
 
//   @override 
//   Widget build(BuildContext context) { 
//     return SafeArea( 
//     child: Scaffold( 
//         body: Container( 
//           width: MediaQuery.of(context).size.width, 
//           height: MediaQuery.of(context).size.height, 
//           decoration: BoxDecoration( 
//             gradient: LinearGradient( 
//                 colors: [const Color(0XFFF95A3B),const Color(0XFFF96713)], 
//                 begin: FractionalOffset.topLeft, 
//                 end: FractionalOffset.bottomCenter, 
//                 stops: [0.0,0.8], 
//                 tileMode: TileMode.mirror 
//             ), 
//           ), 
//           child: Center( 
//             child: SingleChildScrollView( 
//               child: Column( 
//                 mainAxisAlignment: MainAxisAlignment.center, 
//                 children: <Widget>[ 
//                   CommonLogo(), 
//                   HeightBox(10),"Email Sign In".text.size(22).yellow100.make(), 
 
//                   TextField( 
//                     controller: emailController, 
//                     keyboardType: TextInputType.text, 
//                     decoration: InputDecoration( 
//                         filled: true, 
//                         fillColor: Colors.white, 
//                         hintText: "Email", 
//                         errorText: _isNotValidate ? "EnterProper Info" : null, 
//                         border: OutlineInputBorder( 
//                             borderRadius: 
// BorderRadius.all(Radius.circular(10.0)))), 
//                   ).p4().px24(), 
//                   TextField( 
//                     controller: passwordController, 
//                     keyboardType: TextInputType.text, 
//                     decoration: InputDecoration( 
//                         filled: true, 
//                         fillColor: Colors.white,  hintText: "Password", 
//                         errorText: _isNotValidate ? "Enter Proper Info" : null, 
//                         border: OutlineInputBorder( 
//                             borderRadius: 
// BorderRadius.all(Radius.circular(10.0)))), 
//                   ).p4().px24(), 
//                   GestureDetector( 
//                     onTap: (){ 
//                         loginUser(); 
//                     }, 
//                     child: HStack([ 
//                       VxBox(child: 
// "LogIn".text.white.makeCentered().p16()).green600.roundedLg.make
//  (), 
//                     ]), 
//                   ), 
//                 ], 
//               ), 
//             ), 
//           ), 
//         ), 
//         bottomNavigationBar: GestureDetector( 
//  onTap: (){ 
//             Navigator.push(context, MaterialPageRoute(builder: 
// (context)=>Registration())); 
//           }, 
//           child: Container( 
//               height: 25, 
//               color: Colors.lightBlue, 
//               child: Center(child: "Create a new Account..! Sign Up".text.white.makeCentered())), 
//         ), 
//       ), 
//     ); 
//   } 
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:front_end/dashboard.dart';
import 'package:front_end/registration.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'applogo.dart';
import 'package:http/http.dart' as http;
import 'config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isNotValidate = false;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  void loginUser() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var reqBody = {
        "email": emailController.text,
        "password": passwordController.text
      };
      var response = await http.post(
        Uri.parse(login),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqBody),
      );

      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status']) {
        var myToken = jsonResponse['token'];
        prefs.setString('token', myToken);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Dashboard(token: myToken)));
      } else {
        setState(() {
          _isNotValidate = true;
        });
      }
    } else {
      setState(() {
        _isNotValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.lightBlue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CommonLogo(),
                  "Sign In"
                      .text
                      .textStyle(GoogleFonts.poppins(
                          fontSize: 24, color: Colors.white))
                      .make()
                      .p16(),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.9),
                      hintText: "Email",
                      hintStyle: GoogleFonts.poppins(),
                      errorText: _isNotValidate ? "Enter valid email" : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon:
                          Icon(Icons.email, color: Colors.blueAccent),
                    ),
                  ).p4().px24(),
                  TextField(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.9),
                      hintText: "Password",
                      hintStyle: GoogleFonts.poppins(),
                      errorText:
                          _isNotValidate ? "Enter valid password" : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon:
                          Icon(Icons.lock, color: Colors.blueAccent),
                    ),
                  ).p4().px24(),
                  ElevatedButton(
                    onPressed: () => loginUser(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    ),
                    child: Text(
                      "Log In",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 16),
                    ),
                  ).p16().animate().scale(delay: 300.ms),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Registration()));
                    },
                    child: "Create a new account? Sign Up"
                        .text
                        .textStyle(GoogleFonts.poppins(color: Colors.white70))
                        .make()
                        .p16(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}