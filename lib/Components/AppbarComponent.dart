import 'package:ecommerceapp/Components/ComponentsSizes/AppbarComponentSizes.dart';
import 'package:ecommerceapp/Utils/ScreenConfig.dart';
import 'package:ecommerceapp/app_assets/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget AppBarComponent(BuildContext context) {
  ScreenConfig screenConfig = ScreenConfig(context);
  AppbarComponentSizes appbarComponentSizes =  AppbarComponentSizes(screenConfig);
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    title: Text(
      'fasho .',
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: appbarComponentSizes.TitleFontSize,
        ),
      ),
    ),
    leading: Builder(
      builder: (context) {
        return  IconButton(
          icon: Icon(
            CustomIcons.menu,
            size: appbarComponentSizes.MenuIconSize,
            color: Colors.black,
          ),
          onPressed: (){
            Scaffold.of(context).openDrawer();
          },
        );
      },
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(
          CustomIcons.search,
          size: appbarComponentSizes.SearchIconSize,
          color: Colors.black,
        ),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(
          CustomIcons.bag,
          size: appbarComponentSizes.CartIconSize,
          color: Colors.black,
        ),
        onPressed: () {},
      )
    ],
  );
}
