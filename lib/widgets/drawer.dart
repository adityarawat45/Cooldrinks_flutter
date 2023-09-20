// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class appDrawer extends StatelessWidget {
  const appDrawer({super.key, required child});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        // shadowColor: Colors.amber,
        backgroundColor: Colors.blueGrey,
        child: Container(
          color: Colors.blueGrey,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  padding: EdgeInsets.zero,
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: Colors.blueGrey,
                    ),
                    accountName: Text("Aditya Rawat"),
                    accountEmail: Text("rawataditya193@gmail.com"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/userimage.png"),
                    ),
                  )),
              ListTile(
                leading: Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.white,
                ),
                title: Text(
                  "Profile",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.white,
                ),
                title: Text(
                  "Home",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.cart,
                  color: Colors.white,
                ),
                title: Text(
                  "Cart",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.mail,
                  color: Colors.white,
                ),
                title: Text(
                  "Mails",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.settings,
                  color: Colors.white,
                ),
                title: Text(
                  "Settings",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
