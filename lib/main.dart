import 'package:cuki_app/pages/get_started.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Cuki App',
      home: GetStarted(),
      debugShowCheckedModeBanner: false,
    );
  }
}
