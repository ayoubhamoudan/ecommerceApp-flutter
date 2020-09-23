import 'package:ecommerceapp/Components/ComponentsSizes/DrawerComponentSizes.dart';
import 'package:ecommerceapp/Pages/HomePage.dart';
import 'package:ecommerceapp/Utils/ScreenConfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ComponentModels/DrawerModel.dart';

class DrawerComponent extends StatefulWidget {
  @override
  _DrawerComponentState createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  List<DrawerModel> drawerItems = [
    DrawerModel('home', () => HomePage()),
    DrawerModel('collections', () => {}),
    DrawerModel('Cart', () => {}),
    DrawerModel('favourites', () => {}),
    DrawerModel('my orders', () => {}),
    DrawerModel('settings', () => {}),
    DrawerModel('logout', () => {}),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenConfig screenConfig = ScreenConfig(context);
    DrawerComponentSizes drawerComponentSizes = DrawerComponentSizes(screenConfig);
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.15,
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
          ),
          child: Center(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return listElement(index, drawerComponentSizes.TitleFontSize , drawerComponentSizes.IconFontSize);
              },
              itemCount: drawerItems.length,
            ),
          ),
        ),
      ),
    );
  }

  Widget listElement(int index, double TitleSize , double IconSize) {
    return ListTile(
      title: Text(
        drawerItems[index].title,
        style: GoogleFonts.bebasNeue(
          fontSize: TitleSize,
          color: Colors.black,
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return drawerItems[index].destination();
        }));
      },
    );
  }
}
