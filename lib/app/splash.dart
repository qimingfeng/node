
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }

}

class SplashState extends State<Splash> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            _onTap();
          },
          child: Text("主页"),
        ),
      ),
    );
  }


  _onTap() {
    Navigator.of(context).pushNamed("/HomePage");
  }

}