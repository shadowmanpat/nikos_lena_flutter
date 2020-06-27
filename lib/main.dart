import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
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
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Timer timer;
  @override
  void initState() {

    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _incrementCounter());

  }
  void _incrementCounter() {
    setState(() {

    });
  }
  Widget getNumberWiget(int number){
    return Text(number.toString(),
      style: TextStyle(
        color: Colors.pink[800],
        fontSize: 25,
        fontWeight: FontWeight.bold
    ),);
  }
  Widget getTextWidget(String text){
    return Text(text,
      style: TextStyle(
        fontSize: 20,

    ),);
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    var date = new DateTime.now().toString();
    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    var berlinWallFell = DateTime.now();
    var dDay = new DateTime(2014, 1, 20);
    Duration difference = berlinWallFell.difference(dDay);

    var yearsPAssed = dateParse.year - 2014;
    var monthsPassed = (difference.inDays - yearsPAssed * 365)~/30;
    var daysPassed = difference.inDays - (yearsPAssed * 365) - (monthsPassed * 30);
    var hoursPassed = difference.inHours - (difference.inDays * 24);
    var minutesPassed = difference.inMinutes - (difference.inHours * 60);
    var seconds = difference.inSeconds - (difference.inMinutes * 60);
    return Scaffold(
      backgroundColor: Colors.pink[200],
      body:  Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  getNumberWiget(yearsPAssed),SizedBox(width: 5,),getTextWidget("Years"),SizedBox(width: 5,),
                  getNumberWiget(monthsPassed),SizedBox(width: 5,),getTextWidget("Months"),SizedBox(width: 5,),
                  getNumberWiget(daysPassed),SizedBox(width: 5,),getTextWidget("Days"),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    getNumberWiget(hoursPassed),SizedBox(width: 5,),getTextWidget("Hours"),SizedBox(width: 5,),
                    getNumberWiget(minutesPassed),SizedBox(width: 5,),getTextWidget("Minutes"),SizedBox(width: 5,),
                    getNumberWiget(seconds),SizedBox(width: 5,),getTextWidget("Sec"),
                  ],
                ),

              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("NIKOS",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(width: 5,),
                 Image(
                     height: 50,
                     width: 50,
                     image: AssetImage('assets/heart.png')),
                  SizedBox(width: 5,),
                  Text("LENA",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),)
                ],
              ),
              SizedBox(height: 20,),
              Image(
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage('assets/photo.jpg')),
            ],
          ),


    );
  }
}
