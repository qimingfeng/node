import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:node/me/my_favourite_page.dart';

class MeFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MeFragmentState();
  }
}

class MeFragmentState extends State<MeFragment> {
  @override
  Widget build(BuildContext context) {
    return PullRefreshBox(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:
        Column(
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.teal[200]
              ),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[

                ],
              ),
            ),
            Expanded (
              child: Container(
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, i) {
                      return _buildItem(context, i);
                    }),
              ),
            ),
          ],
        )
      ),
      onRefresh: () {
        return _onRefresh();
      },
    );
  }

  Future<bool> _onRefresh() {
    return Future.delayed(Duration(microseconds: 1000), () {
      return true;
    });
  }

  Widget _buildItem(BuildContext context, int index) {
    return Container(
      child: ListTile(
          onTap: () {
            Navigator.pushNamed(context, "/MyFavouritePage",);
          },
          leading: Container(
            child: Icon(Icons.star,),
          ),
          title: Text("我的收藏"),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
    );
  }
}
