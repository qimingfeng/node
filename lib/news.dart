
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
        if(i.isOdd) return new Divider();
        final index = i ~/ 2;

    });
  }


}