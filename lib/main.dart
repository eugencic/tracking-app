import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tracking_app/pages/activity_history/activity_history.dart';
import 'package:tracking_app/pages/home/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tracking App',
      theme: ThemeData(
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        )
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => Home(),
        '/activity_history': (context) => ActivityHistory(),
      },
      initialRoute: '/home',
      //initialRoute: '/home',
      home: ActivityHistory(),
    );
  }
}