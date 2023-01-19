import 'package:cuki_app/pages/welcome.dart';
import 'package:flutter/material.dart';

import '../models/constants.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Constants myConstants = Constants();
    return Scaffold(
      body: Container(
        width: size.height,
        height: size.height,
        color: myConstants.primaryColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/get-started2.png'),
              const SizedBox(height: 30,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const Welcome()));
                },
                child: Container(
                  height: 50,
                  width: size.width * 0.7,
                  decoration: BoxDecoration(
                    color: myConstants.secondaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10))
                  ),
                  child: const Center(
                    child: Text('Get Started', style: TextStyle(color: Colors.white, fontSize: 18),)
                  )
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
