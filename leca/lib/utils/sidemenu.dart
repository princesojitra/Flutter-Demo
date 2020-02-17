import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  final Function() notifyParent;
  final List<Widget> menuOptionWidgets;

  SideMenu({Key key, @required this.notifyParent, this.menuOptionWidgets})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SideMenuState();
  }
}

class _SideMenuState extends State<SideMenu> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: new ListView(
        padding: EdgeInsets.only(top: 50.0),
        children: <Widget>[
          GestureDetector(
            child: Container(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      image: new DecorationImage(
                        image: new NetworkImage(' '),
                        fit: BoxFit.cover,
                      ),
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(50.0)),
                      border: new Border.all(
                        color: Colors.lightGreen,
                        width: 4.0,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 25.0),
                      child: Text(
                        'fasfasfas',
                        style: TextStyle(fontSize: 20.0),
                      ))
                ],
              ),
              padding: EdgeInsets.only(left: 20.0),
            ),
            onTap: () {
              print('Profile view tapped');
            },
          ),
          Padding(padding: EdgeInsets.all(10)),
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
            child: new Column(children: this.widget.menuOptionWidgets),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
