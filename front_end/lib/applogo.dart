// import 'package:flutter/material.dart'; 
// import 'package:velocity_x/velocity_x.dart'; 
// class CommonLogo extends StatelessWidget { 
// @override 
// Widget build(BuildContext context) { 
//    return Column( 
//       mainAxisAlignment: MainAxisAlignment.center, 
//       children: <Widget>[ 
//         Image.network("https://pluspng.com/img-png/avengers logo-png-avengers-logo-png-1376.png",width: 100,), 
//         "To-Do App".text.xl2.italic.make(), 
//         "Make A List of your task".text.light.white.wider.lg.make(), 
//       ], 
//     ); 
//   } 
// }
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CommonLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.network(
          "https://pluspng.com/img-png/avengers-logo-png-avengers-logo-png-1376.png",
          width: 120,
          height: 120,
        )
            .animate()
            .fadeIn(duration: 800.ms)
            .scaleXY(begin: 0.8, end: 1.0),
        "To-Do App"
            .text
            .textStyle(GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ))
            .make()
            .animate()
            .slideY(begin: 0.2, end: 0.0, duration: 600.ms),
        "Organize your tasks with ease"
            .text
            .textStyle(GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: Colors.white70,
            ))
            .wider
            .make()
            .animate()
            .fadeIn(duration: 1000.ms),
      ],
    ).p16();
  }
}