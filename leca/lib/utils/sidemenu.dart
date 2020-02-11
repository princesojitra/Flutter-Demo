import 'package:flutter/material.dart';
import 'package:leca/models/sidemenu_model.dart';
import 'package:leca/app_screens/dashboard.dart';

class SideMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SideMenuState();
  }

  static getMenuItemWidget(MenuItem menuItem) {
    return menuItem.function();
  }
}

class _SideMenuState extends State<SideMenu> {
  MenuItem _selectedMenuItem;
  List<MenuItem> _menuItems;
  List<Widget> _menuOptionWidgets = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _menuItems = createMenuList();
    _selectedMenuItem = _menuItems.first;
    _menuOptionWidgets = [];
    _menuOptionWidgets = createSideMenu();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return new ListView(
      children: <Widget>[
        new Container(
            child: new ListTile(
                leading: new Image.asset('assets/images/lion.png'),
                title: Text("romalon1@gmail.com")),
            margin: new EdgeInsetsDirectional.only(top: 20.0),
            color: Colors.white,
            constraints: BoxConstraints(maxHeight: 90.0, minHeight: 90.0)),
        new SizedBox(
          child: new Center(
            child: new Container(
              margin: new EdgeInsetsDirectional.only(start: 10.0, end: 10.0),
              height: 0.3,
              color: Colors.black,
            ),
          ),
        ),
        new Container(
          color: Colors.white,
          child: new Column(children: _menuOptionWidgets),
        ),
      ],
    );
  }

  List<Widget> createSideMenu() {
    List<Widget> menuWidgets = List<Widget>();

    for (MenuItem menuitem in _menuItems) {
      menuWidgets.add(Container(
        child: ListTile(
          leading: Image.asset(menuitem.image),
          title: Text(menuitem.title,
              style: TextStyle(
                  color: menuitem.color,
                  fontWeight: menuitem == _selectedMenuItem
                      ? FontWeight.bold
                      : FontWeight.w300,
                  fontSize: 20.0)),
        ),
        decoration: BoxDecoration(
          color:
              menuitem == _selectedMenuItem ? Colors.grey[200] : Colors.white,
        ),
      ));

      _menuOptionWidgets.add(
        new SizedBox(
          child: new Center(
            child: new Container(
              margin: new EdgeInsetsDirectional.only(start: 20.0, end: 20.0),
              height: 0.3,
              color: Colors.grey,
            ),
          ),
        ),
      );
    }
  }

  List<MenuItem> createMenuList() {
    List<MenuItem> menulist = List<MenuItem>();
    menulist.add(MenuItem(
        title: 'Dashboard',
        color: Colors.black,
        image: '/assests/dashboard.png',
        function: () => Dashboard()));
    menulist.add(MenuItem(
        title: 'Notification',
        color: Colors.black,
        image: '/assests/notification.png',
        function: () => Dashboard()));
    menulist.add(MenuItem(
        title: 'LECA Media',
        color: Colors.black,
        image: '/assests/media.png',
        function: () => Dashboard()));
    menulist.add(MenuItem(
        title: 'Sales',
        color: Colors.black,
        image: '/assests/sales.png',
        function: () => Dashboard()));
    menulist.add(MenuItem(
        title: 'Counsultant',
        color: Colors.black,
        image: '/assests/consultant.png',
        function: () => Dashboard()));
    menulist.add(MenuItem(
        title: 'About LECA',
        color: Colors.black,
        image: '/assests/About.png',
        function: () => Dashboard()));
    menulist.add(MenuItem(
        title: 'Contact Us',
        color: Colors.black,
        image: '/assests/contactus.png',
        function: () => Dashboard()));
    menulist.add(MenuItem(
        title: 'Privacy Policy',
        color: Colors.black,
        image: '/assests/tc.png',
        function: () => Dashboard()));
    menulist.add(MenuItem(
        title: 'T&C',
        color: Colors.black,
        image: '/assests/tc.png',
        function: () => Dashboard()));
    menulist.add(MenuItem(
        title: 'Feedback',
        color: Colors.black,
        image: '/assests/logout.png',
        function: () => Dashboard()));
    return menulist;
  }
}
