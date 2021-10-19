import 'dart:math';

import 'package:flutter/material.dart';
import 'package:imtihonulugbek/pages/home.dart';

class LoginPages extends StatefulWidget {
  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  List ism = [];
  var _fromKey = GlobalKey<FormState>();
  int usercolor1 = 0;
  int usercolor2 = 0;
  int boshla = 0;
  int random = 0;
  TextEditingController _usernameFirst = TextEditingController();

  TextEditingController _usernameSecond = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Form(
                  key: _fromKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              child: TextFormField(
                                controller: _usernameFirst,
                                validator: (text) {
                                  if (text!.length < 4) {
                                    return "4tadan kam belgi kiritmang";
                                  }
                                },
                                style: TextStyle(fontWeight: FontWeight.bold),
                                decoration: InputDecoration(
                                  labelText: "First name",
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Text("Rangni tanlang"),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                      onPressed: usercolor2 == 1
                                          ? () {}
                                          : () {
                                              setState(() {
                                                usercolor1 = 1;
                                              });
                                            },
                                      child: usercolor2 == 1
                                          ? Text("x")
                                          : Text("Ko'k"),
                                      style: ElevatedButton.styleFrom(
                                          primary: usercolor2 == 1
                                              ? Colors.blue
                                              : Colors.blue),
                                    ),
                                    ElevatedButton(
                                      onPressed: usercolor2 == 2
                                          ? () {}
                                          : () {
                                              setState(() {
                                                print("$random");
                                                usercolor1 = 2;
                                              });
                                            },
                                      child: usercolor2 == 2
                                          ? Text("x")
                                          : Text("Qizil"),
                                      style: ElevatedButton.styleFrom(
                                          primary: usercolor2 == 2
                                              ? Colors.red
                                              : Colors.red),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              child: TextFormField(
                                controller: _usernameSecond,
                                validator: (text) {
                                  if (text!.length < 4) {
                                    return "4tadan kam belgi kiritmang";
                                  }
                                },
                                style: TextStyle(fontWeight: FontWeight.bold),
                                decoration: InputDecoration(
                                  labelText: "Second name",
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Text("Rangni tanlang"),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                      onPressed: usercolor1 == 1
                                          ? () {}
                                          : () {
                                              usercolor2 = 1;
                                            },
                                      child: usercolor1 == 1
                                          ? Text("x")
                                          : Text("Ko'k"),
                                      style: ElevatedButton.styleFrom(
                                          primary: usercolor1 == 1
                                              ? Colors.red
                                              : Colors.blue),
                                    ),
                                    ElevatedButton(
                                      onPressed: usercolor1 == 2
                                          ? () {}
                                          : () {
                                              usercolor2 = 2;
                                            },
                                      child: usercolor1 == 2
                                          ? Text("x")
                                          : Text("Qizil"),
                                      style: ElevatedButton.styleFrom(
                                          primary: usercolor1 == 1
                                              ? Colors.red
                                              : Colors.red),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                          onPressed: () {
                            ism.add(_usernameFirst);
                            if (_fromKey.currentState!.validate()) {
                              setState(() {
                                ism.insert(0,"${_usernameFirst.text.toString()}");
                               ism.insert(1,"${_usernameSecond.text.toString()}");
                                
                                random = Random().nextInt(2) + 1;
                              });
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (BuildContext context) =>
                              //             LoginPages()));
                            }
                          },
                          child: Text("Sumbit"),
                          style: ElevatedButton.styleFrom(primary: Colors.teal),
                        ),
                      )
                    ],
                  )),
            ),
            Center(
                child: random == 0
                    ? Container()
                    : Column(
                        children: [
                          Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color:
                                      random == 1 ? Colors.blue : Colors.red)),
                          ElevatedButton(
                              onPressed: random == usercolor1
                                  ? () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePage(ism, [0, 1])));
                                    }
                                  : () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePage(ism, [1, 0])));
                                    },
                              child: usercolor1 == random
                                  ? Text("First player start")
                                  : Text("Second player start")),
                        ],
                      )),
          ],
        ),
      ),
    );
  }
}
