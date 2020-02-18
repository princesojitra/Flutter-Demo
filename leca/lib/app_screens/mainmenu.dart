import 'package:flutter/material.dart';
import 'package:leca/utils/constants.dart';
import 'package:leca/utils/sidemenu.dart';
import 'package:leca/app_screens/dashboard.dart';
import 'package:leca/app_screens/notifications.dart';

class MainMenu extends StatefulWidget {
  static const routeName = '/mainmenu';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainMenuState();
  }
}

class _MainMenuState extends State<MainMenu> {
  GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  MenuItem _selectedMenuItem;
  List<MenuItem> _menuItems;
  List<Widget> _menuOptionWidgets;
  String _profilePic;
  String _appBarTitle;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _menuItems = createMenuList();
    _appBarTitle = _menuItems.first.title;
    _selectedMenuItem = _menuItems.first;
    _profilePic = ' ';
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    _menuOptionWidgets = [];
    _menuOptionWidgets = createSideMenu();

    return Scaffold(
      key: _key,
      appBar: AppBar(title: Text(_appBarTitle)),
      body: _getMenuItemWidget(_selectedMenuItem),
      drawer: new Drawer(
          child: SideMenu(
        notifyParent: refresh,
        menuOptionWidgets: _menuOptionWidgets,
      )),
    );
  }

  refresh() {
    setState(() {});
  }

  _getMenuItemWidget(MenuItem menuItem) {
    return menuItem.function();
  }

  _onSelectItem(MenuItem menuItem) {
    MenuItem _previousSelectedMenuIem = _selectedMenuItem;

    setState(() {
      _selectedMenuItem = menuItem;
      _appBarTitle = menuItem.title;
    });

    if (menuItem.title == 'Logout') {
      Constants.showAlert(
          title: Constants.AppName,
          context: context,
          message: Constants.ALERT_LogOut,
          isPop: false,
          isTwoButton: true,
          firstBtnTitle: 'No',
          secondBtnTitle: 'Yes',
          secondBtnAction: () {
            //pop to login screen
            Navigator.of(context).pushNamedAndRemoveUntil(
                MainMenu.routeName, (Route<dynamic> route) => false);
            //Navigator.popUntil(context, ModalRoute.withName('/login'));
          },
          firstBtnAction: () {
            setState(() {
              _selectedMenuItem = _previousSelectedMenuIem;
              _appBarTitle = _previousSelectedMenuIem.title;
            });
            Navigator.of(context).pop();
          });
    } else {
      Navigator.of(context).pop();
    }
  }

  List<MenuItem> createMenuList() {
    List<MenuItem> menulist = List<MenuItem>();
    menulist.add(MenuItem(
        title: 'Dashboard',
        color: Colors.black,
        image: 'assests/dashboard.png',
        function: () => Dashboard()));
    menulist.add(MenuItem(
        title: 'Notification',
        color: Colors.black,
        image: 'assests/notification.png',
        function: () => NotificationList()));
    menulist.add(MenuItem(
        title: 'LECA Media',
        color: Colors.black,
        image: 'assests/media.png',
        function: () => Dashboard()));
    menulist.add(MenuItem(
        title: 'Sales',
        color: Colors.black,
        image: 'assests/sales.png',
        function: () => Dashboard()));
    menulist.add(MenuItem(
        title: 'Counsultant',
        color: Colors.black,
        image: 'assests/consultant.png',
        function: () => Dashboard()));
    menulist.add(MenuItem(
        title: 'About LECA',
        color: Colors.black,
        image: 'assests/About.png',
        function: () => Dashboard()));
    menulist.add(MenuItem(
        title: 'Contact Us',
        color: Colors.black,
        image: 'assests/contactus.png',
        function: () => Dashboard()));
    menulist.add(MenuItem(
        title: 'Privacy Policy',
        color: Colors.black,
        image: 'assests/tc.png',
        function: () => Dashboard()));
    menulist.add(MenuItem(
        title: 'T&C',
        color: Colors.black,
        image: 'assests/tc.png',
        function: () => Dashboard()));
    menulist.add(MenuItem(
        title: 'Feedback',
        color: Colors.black,
        image: 'assests/feedback.png',
        function: () => Dashboard()));
    menulist.add(MenuItem(
        title: 'Logout',
        color: Colors.black,
        image: 'assests/logout.png',
        function: () => Dashboard()));
    return menulist;
  }

  List<Widget> createSideMenu() {
    List<Widget> menuWidgets = List<Widget>();

    for (var menuItem in _menuItems) {
      menuWidgets.add(new GestureDetector(
          onTap: () => _onSelectItem(menuItem),
          child: Container(
              constraints: BoxConstraints(maxHeight: 90.0, minHeight: 50.0),
              decoration: new BoxDecoration(
                  color: menuItem == _selectedMenuItem
                      ? Colors.lightGreen
                      : Colors.white),
              child: Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Row(children: <Widget>[
                    Image.asset(
                      menuItem.image,
                      width: 30.0,
                      height: 30.0,
                      color: menuItem == _selectedMenuItem
                          ? Colors.white
                          : Colors.grey,
                    ),
                    Padding(padding: EdgeInsets.only(left: 20.0)),
                    Expanded(
                        child: Text(
                      menuItem.title,
                      style: new TextStyle(
                          fontSize: 20.0,
                          color: menuItem == _selectedMenuItem
                              ? Colors.white
                              : menuItem.color,
                          fontWeight: menuItem == _selectedMenuItem
                              ? FontWeight.bold
                              : FontWeight.w300),
                    ))
                  ])))));
    }
    return menuWidgets;
  }
}

class MenuItem {
  String title;
  String image;
  Color color;
  Function function;

  MenuItem({this.title, this.image, this.color, this.function});
}
