import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_1/screens/options/optionsScreen.dart';
import 'package:project_1/shared/NavigationDrawer/appDrawerItem.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Text(
                'MENU',
                style: TextStyle(color: Colors.white, fontSize: 27),
              ),
            ),
            AppDrawerItem(
              mark:
                  //Icons.map
                  Icons.menu_open,
              text: 'OPTION',
              route: OptionScreen(),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
