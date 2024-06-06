// ignore_for_file: avoid_unnecessary_containers, non_constant_identifier_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ResultPage extends StatelessWidget {

  final double toxicity;
  final double severe_toxicity;
  final double obscene;
  final double threat;
  final double insult;
  final double identity_attack;

  const ResultPage({super.key, required this.toxicity, required this.severe_toxicity, required this.obscene, required this.threat, required this.insult, required this.identity_attack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Toxic Comment analysis', textAlign: TextAlign.center, style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.black, fontSize: 18, letterSpacing: 1, fontWeight: FontWeight.w600)))
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color.fromARGB(255, 237, 234, 205)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Toxic Comment Result Analysis', textAlign: TextAlign.center, style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
                const SizedBox(height: 30),
                Container(
                  child: Column(
                    children: [
                      Text('Toxicity Level of the Comment', textAlign: TextAlign.center, style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 19, fontWeight: FontWeight.bold))),
                      const SizedBox(height: 6),
                      Text("$toxicity%", textAlign: TextAlign.center, style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 178, 165, 52))))
                    ],
                  ),
                ),
                const SizedBox(height: 13),
                Container(
                  child: Column(
                    children: [
                      Text('Severe Toxicity Level of the Comment', textAlign: TextAlign.center, style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 19, fontWeight: FontWeight.bold))),
                      const SizedBox(height: 6),
                      Text("$severe_toxicity%", textAlign: TextAlign.center, style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 178, 165, 52))))
                    ],
                  ),
                ),
                const SizedBox(height: 13),
                Container(
                  child: Column(
                    children: [
                      Text('Obscene Level of the Comment', textAlign: TextAlign.center, style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 19, fontWeight: FontWeight.bold))),
                      const SizedBox(height: 6),
                      Text("$obscene%", textAlign: TextAlign.center, style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 178, 165, 52))))
                    ],
                  ),
                ),
                const SizedBox(height: 13),
                Container(
                  child: Column(
                    children: [
                      Text('Threat Level of the Comment', textAlign: TextAlign.center, style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 19, fontWeight: FontWeight.bold))),
                      const SizedBox(height: 6),
                      Text("$threat%", textAlign: TextAlign.center, style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 178, 165, 52))))
                    ],
                  ),
                ),
                const SizedBox(height: 13),
                Container(
                  child: Column(
                    children: [
                      Text('Insult Level of the Comment', textAlign: TextAlign.center, style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 19, fontWeight: FontWeight.bold))),
                      const SizedBox(height: 6),
                      Text("$insult%", textAlign: TextAlign.center, style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 178, 165, 52))))
                    ],
                  ),
                ),
                const SizedBox(height: 13),
                Container(
                  child: Column(
                    children: [
                      Text('Identity Attack Level of the Comment', textAlign: TextAlign.center, style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 19, fontWeight: FontWeight.bold))),
                      const SizedBox(height: 6),
                      Text("$identity_attack%", textAlign: TextAlign.center, style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 178, 165, 52))))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
