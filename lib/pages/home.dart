import 'package:flutter/material.dart';

import '../models/city.dart';
import '../models/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Constants myConstants = Constants();

  int temperature = 0;
  int maxTemp = 0;
  String weatherStateName = 'Loading...';
  int humidity = 0;
  int windSpeed = 0;
  var currentDate = 'Loading...';
  String imageUrl = '';
  int woeid = 44418;//default london
  String location = 'london';//default city
  //ambil kota dan pilihan data kota
  var selectedCities = City.getSelectedCities();
  List<String> cities = ['London'];//list yang menampung pilihan kota. Defaultnya london

  List consolidateWeatherList = [];//Untuk menampung data cuaca setelah pemanggilan api
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text('Home Page'),
      ),
    );
  }
}
