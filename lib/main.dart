import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;
  var result = "";
  var weight = TextEditingController();
  var heightft = TextEditingController();
  var heightinch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('YOUR BMI'),
      ),
      body: Container(
        color: Colors.tealAccent,
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 12),
                Text(
                  'BMI',
                  style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                      color: Colors.purpleAccent),
                ),
                SizedBox(height: 12),
                TextField(
                  controller: weight,
                  decoration: InputDecoration(
                      label: Text('Enter your weight in kg'),
                      prefixIcon: Icon(Icons.line_weight)),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: heightft,
                  decoration: InputDecoration(
                      label: Text('Enter your height in feet'),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: heightinch,
                  decoration: InputDecoration(
                      label: Text('and inches'),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: ElevatedButton(
                      onPressed: () {
                        var wt = weight.text.toString();
                        var htft = heightft.text.toString();
                        var htin = heightft.text.toString();
                        if (wt == "" || htft == "" || htin == "") {
                          setState(() {
                            result = "please fill all the required fields";
                          });
                        } else
                          ;
                        var iwt = int.parse(wt);
                        var ihtft = int.parse(htft);
                        var ihtin = int.parse(htin);
                        var totalinch = ihtft * 12 + ihtin;
                        var metre = totalinch / 39.37;
                        var tcm = metre * 2.54;
                        var tm = tcm / 100;

                        var bmi = iwt / (tm * tm);
                        setState(() {
                          result = "${bmi.toStringAsFixed(4)} kg/m^2";
                        });
                      },
                      child: Text('CALCULATE')),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text(
                    "RESULT: $result",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.red,
                        backgroundColor: Colors.yellow),
                  ),
                )
              ],
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
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
