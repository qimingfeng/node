
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';

class MeFragment extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MeFragmentState();
  }

}

class MeFragmentState extends State<MeFragment> {

  @override
  Widget build(BuildContext context) {
    return PullRefreshBox (
      child: Scaffold(
        body: Container(

        ),
      ),
    );
  }

}