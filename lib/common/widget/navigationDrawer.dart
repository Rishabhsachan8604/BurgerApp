import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(),
          createDrawerBodyItem(
              icon: Icons.home, text: 'Home', onTap: () { }),
          createDrawerBodyItem(
              icon: Icons.account_circle, text: 'Profile', onTap: () { }),

          createDrawerBodyItem(
              icon: Icons.event_note, text: 'Events', onTap: () {}),
          Divider(),
          createDrawerBodyItem(
              icon: Icons.notifications_active,
              text: 'Notifications',
              onTap: () {}),
          createDrawerBodyItem(
              icon: Icons.contact_phone, text: 'Contact Info', onTap: () {}),
          ListTile(
            title: Text('App version 1.0.0'),
            onTap: () {},
          ),
        ],
      ),
    );
  }


  Widget createDrawerBodyItem(
      {required IconData icon, required String text, required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  Widget createDrawerHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/logo.png'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Sky Rocket Burger",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }
}