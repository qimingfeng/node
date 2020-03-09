
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class Splash extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }

}

class SplashState extends State<Splash> {

  int _status;

  StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    _status = 3;
    _doCountDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            _goHome();
          },
          child: Text(_status.toString()),
        ),
      ),
    );
  }


  _goHome() {
    Navigator.of(context).pushReplacementNamed("/HomePage");
  }

  void _doCountDown() {
    _subscription = Observable.periodic(Duration(milliseconds: 1000))
    .listen((x) {
      print(_status);
      if(_status == 1) {
        _goHome();
        _subscription.cancel();
      } else{
        setState(() {
          _status--;
        });
      }
    });
  }

}