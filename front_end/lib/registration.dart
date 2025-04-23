// import 'dart:convert';
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:velocity_x/velocity_x.dart';
// import 'applogo.dart';
// import 'loginPage.dart';
// import 'package:http/http.dart' as http;
// import 'Config.dart';

// class Registration extends StatefulWidget {
//   @override
//   _RegistrationState createState() => _RegistrationState();
// }

// class _RegistrationState extends State<Registration> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   bool _isNotValidate = false;
//   void registerUser() async {
//   if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
//     var regBody = {
//       "email": emailController.text,
//       "password": passwordController.text,
//     };
//     print("Registration Body: $regBody");
//     try {
//       var response = await http
//           .post(
//             Uri.parse(registration),
//             headers: {"Content-Type": "application/json"},
//             body: jsonEncode(regBody),
//           )
//           .timeout(Duration(seconds: 10));

//       print("Response status: ${response.statusCode}");
//       print("Response body: ${response.body}");

//       var jsonResponse = jsonDecode(response.body);

//       if (jsonResponse['status'] == true) {
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(SnackBar(content: Text("Registration Successful ✅")));

//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => SignInPage()),
//         );
//       } else {
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(SnackBar(content: Text("Registration Failed ❌")));
//       }
//     } catch (e) {
//       print("Error: $e");

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error connecting to server 🔌$e")),
//       );
//     }
//   } else {
//     setState(() {
//       _isNotValidate = true;
//     });
//   }
// }


//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [const Color(0XFFF95A3B), const Color(0XFFF96713)],
//               begin: FractionalOffset.topLeft,
//               end: FractionalOffset.bottomCenter,
//               stops: [0.0, 0.8],
//               tileMode: TileMode.mirror,
//             ),
//           ),
//           child: Center(
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   CommonLogo(),
//                   HeightBox(10),
//                   "CREATE YOUR ACCOUNT".text.size(22).yellow100.make(),
//                   TextField(
//                     controller: emailController,
//                     keyboardType: TextInputType.text,
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white,
//                       errorStyle: TextStyle(color: Colors.white),
//                       errorText: _isNotValidate ? "EnterProper Info" : null,
//                       hintText: "Email",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                       ),
//                     ),
//                   ).p4().px24(),
//                   TextField(
//                     controller: passwordController,
//                     keyboardType: TextInputType.text,
//                     decoration: InputDecoration(
//                       suffixIcon: IconButton(
//                         icon: Icon(Icons.copy),
//                         onPressed: () {
//                           final data = ClipboardData(
//                             text: passwordController.text,
//                           );
//                           Clipboard.setData(data);
//                         },
//                       ),
//                       prefixIcon: IconButton(
//                         icon: Icon(Icons.password),
//                         onPressed: () {
//                           String passGen = generatePassword();
//                           passwordController.text = passGen;
//                           setState(() {});

//                           print("Generated Password: $passGen");
//                         },
//                       ),
//                       filled: true,
//                       fillColor: Colors.white,
//                       errorStyle: TextStyle(color: Colors.white),
//                       errorText: _isNotValidate ? "Enter Proper Info" : null,
//                       hintText: "Password",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                       ),
//                     ),
//                   ).p4().px24(),
//                   HStack([
//                     GestureDetector(
//                       onTap: () => {registerUser()},
//                       child:
//                           VxBox(
//                             child: "Register".text.white.makeCentered().p16(),
//                           ).green600.roundedLg.make().px16().py16(),
//                     ),
//                   ]),
//                   GestureDetector(
//                     onTap: () {
//                       print("Sign In");
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => SignInPage()),
//                       );
//                     },
//                     child:
//                         HStack([
//                           "Already Registered?".text.make(),
//                           " Sign In".text.white.make(),
//                         ]).centered(),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// String generatePassword() {
//   String upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
//   String lower = 'abcdefghijklmnopqrstuvwxyz';
//   String numbers = '1234567890';
//   String symbols = '!@#\$%^&*()<>,./';

//   String password = '';

//   int passLength = 20;

//   String seed = upper + lower + numbers + symbols;

//   List<String> list = seed.split('').toList();

//   Random rand = Random();

//   for (int i = 0; i < passLength; i++) {
//     int index = rand.nextInt(list.length);
//     password += list[index];
//   }
//   return password;
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'applogo.dart';
import 'loginPage.dart';
import 'package:http/http.dart' as http;
import 'config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:math';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isNotValidate = false;

  void registerUser() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var regBody = {
        "email": emailController.text,
        "password": passwordController.text,
      };
      try {
        var response = await http
            .post(
              Uri.parse(registration),
              headers: {"Content-Type": "application/json"},
              body: jsonEncode(regBody),
            )
            .timeout(Duration(seconds: 10));

        var jsonResponse = jsonDecode(response.body);

        if (jsonResponse['status'] == true) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Registration Successful ✅")));
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SignInPage()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Registration Failed ❌")));
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error connecting to server 🔌")));
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
                  "Create Your Account"
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
                      suffixIcon: IconButton(
                        icon: Icon(Icons.password, color: Colors.blueAccent),
                        onPressed: () {
                          passwordController.text = generatePassword();
                          setState(() {});
                        },
                      ),
                    ),
                  ).p4().px24(),
                  ElevatedButton(
                    onPressed: () => registerUser(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    ),
                    child: Text(
                      "Register",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 16),
                    ),
                  ).p16().animate().scale(delay: 300.ms),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignInPage()));
                    },
                    child: "Already have an account? Sign In"
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

  String generatePassword() {
    String upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    String lower = 'abcdefghijklmnopqrstuvwxyz';
    String numbers = '1234567890';
    String symbols = '!@#\$%^&*()<>,./';

    String password = '';
    int passLength = 20;
    String seed = upper + lower + numbers + symbols;
    List<String> list = seed.split('').toList();
    Random rand = Random();

    for (int i = 0; i < passLength; i++) {
      int index = rand.nextInt(list.length);
      password += list[index];
    }
    return password;
  }
}