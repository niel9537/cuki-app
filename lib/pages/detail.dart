import 'package:flutter/material.dart';

import '../models/constants.dart';

class DetailPage extends StatefulWidget {
  final dailyForecastWeather;
  const DetailPage({Key? key, this.dailyForecastWeather}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final Constants myConstants = Constants();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myConstants.secondaryColor,
      appBar: AppBar(
        title: Text('About Us'),
      ),
    );
  }
}
