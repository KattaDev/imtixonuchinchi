import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:imtihonulugbek/jokes/jokeclass.dart';

class Joke extends StatefulWidget {
  const Joke({ Key? key }) : super(key: key);

  @override
  _JokeState createState() => _JokeState();
}

class _JokeState extends State<Joke> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(future: _getPostFromAPi(),builder: (context,AsyncSnapshot<Voice> snap){
        var data=snap.data;
          return Container(child: Text("${data!.joke}"),);
        }),


      ),
      
    );
  }

  Future<Voice> _getPostFromAPi() async {
    var _res = await http
        .get(Uri.parse("https://geek-jokes.sameerkumar.website/api?format=json"));
    if (_res.statusCode == 200) {
      return Voice.fromJson(jsonDecode(_res.body));
    } else {
      throw Exception("Error");
    }
  }
}