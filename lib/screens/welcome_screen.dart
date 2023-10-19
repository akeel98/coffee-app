import 'package:coffy_application/consts.dart';
import 'package:coffy_application/screens/home_screen.dart';
import 'package:coffy_application/screens/mainScreen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SizedBox(
      height: size.height,
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height / 1.5,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/welcome.png'),
                    fit: BoxFit.cover)),
          ),
          Positioned(
            top: size.height * 0.6,
            height: size.height,
            left: 0,
            right: 0,
            child: Container(
              color: const Color(0xff000000),
              child: const Column(
                children: [
                  Text(
                    "Coffee so good,\n"
                    "Your taste buds\n"
                    "Will love it",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 2),
                  Text(
                    "The best grain, the finest roast,\nthe powerful flavor",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: size.width * 0.05,
            top: size.height * 0.87,
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const MainScreen()));
              },
              child: Container(
                  height: size.height * 0.08,
                  width: size.width * 0.9,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius:
                          BorderRadius.all(Radius.circular(size.width * 0.05))),
                  child:const Text(
                    'Get Started',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          )
        ],
      ),
    ));
  }
}
