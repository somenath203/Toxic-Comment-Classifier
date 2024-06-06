// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:toxitityapp/pages/predict_page.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Toxic Comment Classifier', textAlign: TextAlign.center, style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.black, fontSize: 18, letterSpacing: 1, fontWeight: FontWeight.w600)))
      ),
      body: Center(
        child: Container(

          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Color.fromARGB(255, 237, 234, 205)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),

          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset('assets/welcome_page_pic.png', fit: BoxFit.cover)
                )
              ),
              const SizedBox(height: 25),
              Text('Toxic Comment Classifier', textAlign: TextAlign.center, style: GoogleFonts.poppins(textStyle: TextStyle(color: Color.fromARGB(255, 181, 169, 37), fontSize: 26, fontWeight: FontWeight.bold))),
              const SizedBox(height: 15),
              Text('A tool to perfectly classify toxic comment', textAlign: TextAlign.center, style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.black, fontSize: 18, letterSpacing: 1, fontWeight: FontWeight.w600))),
              const SizedBox(height: 30),
              Container(
                width: double.maxFinite,
                height: 62,
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PredictPage()));
                    }, 
                    style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0), side: BorderSide(color: const Color.fromARGB(255, 211, 192, 24), width: 3))),
                    child: Text('Get Started', textAlign: TextAlign.center, style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.black, fontSize: 19, letterSpacing: 1, fontWeight: FontWeight.w500)))
                  )
              )
            ],
          )
        )
      )
    );
  }
}
