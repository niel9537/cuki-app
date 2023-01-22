import 'package:cuki_app/pages/get_started.dart';
import 'package:cuki_app/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyC2xuvWrS6E82VAR6V0Pkme5DS-f32mmvQ",
        appId: "1:787554708489:android:f13c4732e7876584e6dcd8",
        messagingSenderId: "787554708489",
        projectId: "cuki-app"),
  );
  await initialization(null);
  runApp(MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(Duration(seconds: 3));
}

// void main(){
//   runApp(MyApp());
// }
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Cuki App',
      home: LoginScreen(),
      // home: GetStarted(),
      debugShowCheckedModeBanner: false,
    );
  }
}
