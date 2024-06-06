// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, avoid_print, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:toxitityapp/models/pred_result_model.dart';
import 'package:toxitityapp/pages/result_page.dart';

class PredictPage extends StatefulWidget {
  
  const PredictPage({super.key});

  @override
  State<PredictPage> createState() => _PredictPageState();
}

class _PredictPageState extends State<PredictPage> {

  TextEditingController commentByUser = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Toxic Comment Predict', textAlign: TextAlign.center, style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.black, fontSize: 18, letterSpacing: 1, fontWeight: FontWeight.w600)))
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
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(hintText: 'Enter the Comment'),
                controller: commentByUser,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 45,
                width: double.maxFinite,
                child: !isLoading ? ElevatedButton(onPressed: () async {

                  if(commentByUser.text == '') {

                    setState(() {
                        isLoading = false;
                    });

                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please fill the input field.')));

                  } else {

                    try {
                      
                      var client = http.Client();

                      setState(() {
                        isLoading = true;
                      });

                      final res = await client.post(Uri.parse("http://10.0.2.2:8000/predict"), body: jsonEncode(
                        {
                          "inputText": commentByUser.text
                        },
                      ), headers: {"Content-Type": "application/json"});

                      setState(() {
                        isLoading = false;
                      });
                    
                    if(res.statusCode >= 200 && res.statusCode <= 300) {
                      
                      PredictResult predictionResult = predictResultFromJson(res.body);

                      print(predictionResult);
                      
                      if(!predictionResult.isEmpty()) {

                        Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
                          toxicity: predictionResult.toxicity,
                          severe_toxicity: predictionResult.severe_toxicity,
                          obscene: predictionResult.obscene,
                          threat: predictionResult.threat,
                          insult: predictionResult.insult,
                          identity_attack: predictionResult.identity_attack
                        )));

                      }

                    }

                    } catch (e) {
                      
                      print(e);

                    }

                  }
                },
                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0), side: BorderSide(color: const Color.fromARGB(255, 211, 192, 24), width: 3))),
                child: Text('Predict', textAlign: TextAlign.center, style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.black, fontSize: 19, letterSpacing: 1, fontWeight: FontWeight.w500)))
              ) : Center(child: CircularProgressIndicator())),
            ],
          )
        )
    );
  }
}