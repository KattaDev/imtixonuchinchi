// To parse this JSON data, do
//
//     final voice = voiceFromJson(jsonString);

import 'dart:convert';

Voice voiceFromJson(String str) => Voice.fromJson(json.decode(str));

String voiceToJson(Voice data) => json.encode(data.toJson());

class Voice {
    Voice({
        this.joke,
    });

    String? joke;

    factory Voice.fromJson(Map<String, dynamic> json) => Voice(
        joke: json["joke"],
    );

    Map<String, dynamic> toJson() => {
        "joke": joke,
    };
}
