import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../models/city.dart';
import '../models/constants.dart';
import 'package:http/http.dart' as http;
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController cityController = TextEditingController();
  final Constants myConstants = Constants();
  static String API_KEY = "cbee2ea0acf448bbbeb133319232001";
  int temperature = 0;
  int windSpeed = 0;
  int maxTemp = 0;
  String weatherStateName = 'Loading...';
  int humidity = 0;
  String weatherIcon = "heavycloud.png";
  int cloud = 0;
  var currentDate = 'Loading...';
  String imageUrl = '';
  int woeid = 44418;//default london
  String location = 'london';//default city
  //ambil kota dan pilihan data kota
  var selectedCities = City.getSelectedCities();
  List<String> cities = ['London'];//list yang menampung pilihan kota. Defaultnya london
  List hourlyWeatherForecast = [];
  List dailyWeatherForecast = [];
  String currentWeatherStatus = '';

  //Api
  String searchWeatherAPI = "http://api.weatherapi.com/v1/forecast.json?key="+ API_KEY + "&days=7&q=";
  //Untuk menampung data cuaca setelah pemanggilan api
  void fetchWeatherData(String searchText) async{
    try{
      var searchResult = await http.get(Uri.parse(searchWeatherAPI + searchText));

      final weatherData = Map<String,dynamic>.from(
        json.decode(searchResult.body) ?? 'No Data');

      var locationData = weatherData["location"];
      var currentWeather = weatherData["current"];

      setState((){
        location = getShortLocationName(locationData["name"]);
        var parsedDate = DateTime.parse(locationData["localtime"].substring(0,10));
        var newDate = DateFormat('MMMMEEEEd').format(parsedDate);
        currentDate = newDate;

        //update cuaca
        currentWeatherStatus = currentWeather["condition"]["text"];
        weatherIcon = currentWeatherStatus.replaceAll(' ', '').toLowerCase() + " .png";
        temperature = currentWeather["temp_c"].toInt();
        windSpeed = currentWeather["wind_kph"].toInt();
        humidity = currentWeather["humidity"].toInt();
        cloud = currentWeather["cloud"].toInt();

        dailyWeatherForecast = weatherData["forecast"]["forecastday"];
        hourlyWeatherForecast = dailyWeatherForecast[0]["hour"];
        print(dailyWeatherForecast);
      });
    }catch(e){

    }
  }

  static String getShortLocationName(String s){
    List<String> wordList = s.split(" ");

    if(wordList.isNotEmpty){
      if(wordList.length > 1){
        return wordList[0] + " " + wordList[1];
      }else{
        return wordList[0];
      }
    }else{
      return "";
    }
  }

  @override
  void initState(){
    fetchWeatherData(location);
    super.initState();
  }
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.only(top: 70,left: 10,right:10),
        color: myConstants.secondaryColor.withOpacity(.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: size.height * .7,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: myConstants.secondaryColor.withOpacity(.5),
                    spreadRadius: 5,
                    blurRadius: 2,
                    offset: const Offset(0, 3),

                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/menu.png",
                      width: 40,
                      height: 40,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/pin.png",width: 20,),
                        const SizedBox(width: 2,),
                        Text(location, style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),),
                        IconButton(onPressed: (){
                            cityController.clear();
                            showMaterialModalBottomSheet(context: context, builder: (context)=>SingleChildScrollView(
                              controller: ModalScrollController.of(context),
                              child: Container(
                                height: size.height * 2,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 70,
                                      child: Divider(
                                        thickness: 3.5,
                                        color: myConstants.primaryColor,
                                      ),
                                    ),
                                    const SizedBox(height: 10,),
                                    TextField(
                                      onChanged: (searchText){
                                        fetchWeatherData(searchText);
                                      },
                                      controller: cityController,
                                      autofocus: true,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.search, color: myConstants.primaryColor),
                                        suffixIcon: GestureDetector(
                                          onTap: ()=> cityController.clear(),
                                          child: Icon(Icons.close, color: myConstants.primaryColor,),

                                        ),
                                        hintText: 'Cari Kota',
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: myConstants.primaryColor,
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        )
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            );
                        }, icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white,))
                      ],
                    )
                  ],
                ),
              ],
            )
          ],

        ),
      ),
    );
  }
}
