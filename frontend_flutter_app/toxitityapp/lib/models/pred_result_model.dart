// ignore_for_file: non_constant_identifier_names

import 'dart:convert';


class PredictResult {

    double toxicity; 
    double severe_toxicity;
    double obscene;
    double threat;
    double insult; 
    double identity_attack;

    PredictResult({ required this.toxicity, required this.severe_toxicity, required this.threat, required this.identity_attack, required this.insult, required this.obscene });

    factory PredictResult.fromJson(Map<String, dynamic> json) => PredictResult(
      toxicity: double.parse(json["toxicity"]),
      severe_toxicity: double.parse(json["severe_toxicity"]),
      obscene: double.parse(json["obscene"]),
      threat: double.parse(json["threat"]),
      insult: double.parse(json["insult"]),
      identity_attack: double.parse(json["identity_attack"]),
  );

  bool isEmpty() {
    return toxicity == 0.0 &&
           severe_toxicity == 0.0 &&
           obscene == 0.0 &&
           threat == 0.0 &&
           insult == 0.0 &&
           identity_attack == 0.0;
  }

}


PredictResult predictResultFromJson(String str) => PredictResult.fromJson(json.decode(str)["final_result"]);