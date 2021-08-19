import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff4dc89a),
        scaffoldBackgroundColor: Color(0xffffffff),
        brightness: Brightness.light,
        primarySwatch: Colors.teal,
        textTheme: TextTheme(
          headline6: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            height: 1.7,
          ),
        ),
      ),
      home: MyHomePage(title: 'Trash app demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

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

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  uploadStory() {
    FirebaseFirestore.instance.collection('zip').doc().set({
      'zip': 'laaaa',
    });
  }

  // void choiceAction(String choice) {
  //   if (choice == SettingsLa.version) {
  //     launch(_emailLaunchUri.toString());
  //   }
  // }

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
        title: Text(widget.title),
        elevation: 0,
        actions: [],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: <Widget>[
              Text(
                'Type in your zip code',
                style: Theme.of(context).textTheme.headline6,
              ),
              Form(
                child: TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.pin_drop),
                    hintText: 'Fill in your zip code',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => uploadStory(),
                child: const Text('search'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
