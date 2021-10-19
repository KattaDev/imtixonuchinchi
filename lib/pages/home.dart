import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:imtihonulugbek/model/questionclass.dart';

class HomePage extends StatefulWidget {
  List? ism;
  List? random;
  HomePage(this.ism, this.random);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int urinish = 0;
  int birinchi = 0;
  int ikkinchi = 0;
  int Oyinchi = 0;
  int savolindexi = 0;
  int togri = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: FutureBuilder(
              future: savolol(context),
              builder: (context, AsyncSnapshot<List<Question>> snap) {
                var data = snap.data;
                return snap.hasData
                    ? Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Column(
                          children: [
                            Text("${urinish + 1} O'yinchi: ",style: TextStyle(color: Colors.teal,fontSize: 20,fontWeight: FontWeight.bold),),
                            Text(
                                "${data![savolindexi].savol}",style: TextStyle(fontSize: 20),),
                            Container(
                              height: 250,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    onTap: () {
                                      if (index == data[savolindexi].javob) {
                                        setState(() {
                                          togri++;
                                        });
                                      }
                                    },
                                    leading: CircleAvatar(
                                      child: Text("${index + 1}"),
                                    ),
                                    title: Text(
                                        "${data[savolindexi].javoblar![index]}"),
                                  );
                                },
                                itemCount: 3,
                              ),
                            ),
                            
                          ElevatedButton(
                                onPressed: urinish == 0
                                    ? () {
                                        if (savolindexi == 4) {
                                          birinchi = togri;
                                          setState(() {
                                            urinish++;
                                            savolindexi = 0;
                                            togri = 0;
                                          });
                                        } else {}
                                        setState(() {
                                          savolindexi++;
                                        });
                                      }
                                    : () {
                                        if (savolindexi == 4) {
                                          ikkinchi = togri;
                                          setState(() {
                                            urinish = 0;
                                            savolindexi = 0;
                                            togri = 0;
                                          });
                                        } else {}
                                        setState(() {
                                          savolindexi++;
                                        });
                                      },
                                child: Text("Next")),
                           Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "${widget.ism![widget.random![0]]}: $birinchi",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                      "${widget.ism![widget.random![1]]}: $ikkinchi",
                                      style: TextStyle(fontSize: 20))
                                ],
                              ),
                            ),
                            Container(margin: EdgeInsets.all(10) ,child: birinchi>ikkinchi? Text("${widget.ism![widget.random![0]]}, G'olib",style: TextStyle(color: Colors.red,fontSize: 20),):Text("${widget.ism![widget.random![1]]}, G'olib",style: TextStyle(color: Colors.red,fontSize: 20),),)
                             ],
                        ),
                      )
                    : snap.hasError
                        ? Center(
                            child: Text(snap.error.toString()),
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          );
              })),
    );
  }

  Future<List<Question>> savolol(context) async {
    var jsonim = await DefaultAssetBundle.of(context)
        .loadString("assets/data/data.json");
    print(jsonim);
    // List mashinalist = json.decode(jsonim.toString());
    // List<Question> savollist = (jsonDecode(jsonim) as List)
    //     .map((e) => Question.fromJson(e))
    //     .toList();
    List<Question> savollist =
        (jsonDecode(jsonim) as List).map((e) => Question.fromJson(e)).toList();
    print(savollist);

    return savollist;
  }
}
