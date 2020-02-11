import 'package:flutter/material.dart';
import 'package:leca/models/login_serialize.dart';
import 'package:leca/utils/sidemenu.dart';
import 'package:leca/models/sidemenu_model.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DashboardState();
  }
}

class _DashboardState extends State<Dashboard> {
//  MenuItem _selectedMenuItem;
//  List<MenuItem> _menuItems;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    _menuItems = SideMenu.createMenuList();
//    _selectedMenuItem = _menuItems.first;
  }

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
//        leading: GestureDetector(
//          child: Icon(Icons.menu),
//          onTap: () {
//            print('menu drawer tapoped');
//          },
//        ),
      ),
      body: Container(),
      drawer: new Drawer(
          child: SideMenu()),
    );
  }


}
