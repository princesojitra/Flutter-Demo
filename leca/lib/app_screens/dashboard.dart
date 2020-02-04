import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DashboardState();
  }
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        elevation: 10.0,
        brightness: Brightness.light,
//        bottom: PreferredSize(
//            child: Icon(
//              Icons.linear_scale,
//              size: 60.0,
//            ),
//            preferredSize: Size.fromHeight(50.0)),
        leading: GestureDetector(
          child: Icon(Icons.menu),
          onTap: () {
            print('menu drawer tapoped');
          },
        ),
      ),
      body: Container(),
    );
  }
}
