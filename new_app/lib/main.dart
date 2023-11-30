import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "",
    appId: "1:142236489628:android:021d3008481317a5e61a59",
    messagingSenderId: "142236489628",
    projectId: "slam-book-4c34f",
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'SlamBook',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(
        title: "Slam Book"
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool a = false;
  TextEditingController name = TextEditingController();
  TextEditingController place = TextEditingController();
  TextEditingController slamdata = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController phone = TextEditingController();
  void call() {
    setState(() {
      a = !a;
    });
    print("Thanks!!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("lib/images/slam2.jpg"),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 300.0,
                    child: TextFormField(
                        keyboardType: TextInputType.text,
                        style: const TextStyle(color: Colors.black),
                        maxLines: 1,
                        controller: name,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            contentPadding: EdgeInsets.all(20),
                            hintText: "Add your name here",
                            hintStyle: TextStyle(color: Colors.black))),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                      width: 300.0,
                      child: TextFormField(
                          keyboardType: TextInputType.text,
                          style: const TextStyle(color: Colors.black),
                          maxLines: 1,
                          controller: place,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              contentPadding: EdgeInsets.all(20),
                              hintText: "Place we met first!!",
                              hintStyle: TextStyle(color: Colors.black)))),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                      width: 300.0,
                      child: TextFormField(
                          keyboardType: TextInputType.text,
                          style: const TextStyle(color: Colors.black),
                          maxLines: 10,
                          controller: slamdata,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              contentPadding: EdgeInsets.all(20),
                              hintText: "Share our memories",
                              hintStyle: TextStyle(color: Colors.black)))),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const SizedBox(
                      width: 10,
                      height: 20,
                    ),
                    SizedBox(
                        width: 300.0,
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: Colors.black),
                            controller: location,
                            maxLines: 1,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                contentPadding: EdgeInsets.all(20),
                                hintText: "Location",
                                hintStyle: TextStyle(color: Colors.black)))),
                    const SizedBox(
                      width: 10,
                      height: 20,
                    ),
                    SizedBox(
                        width: 300.0,
                        child: TextFormField(
                            style: const TextStyle(color: Colors.black),
                            keyboardType: TextInputType.text,
                            maxLines: 1,
                            controller: phone,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                contentPadding: EdgeInsets.all(20),
                                hintText: "Contact number",
                                hintStyle: TextStyle(color: Colors.black)))),
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Map<String, dynamic> data = {
                        "Name": name.text,
                        "Place": place.text,
                        "Slam_Information": slamdata.text,
                        "Location": location.text,
                        "Contact": phone.text
                      };
                      FirebaseFirestore.instance.collection("test").add(data);
                    },
                    child: Text("Submit"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: a ? Colors.blue : Colors.greenAccent,
                    ),
                  )
                ],
              )),
        ));
  }
}
