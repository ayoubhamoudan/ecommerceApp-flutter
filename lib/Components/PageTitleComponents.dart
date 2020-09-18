import 'package:ecommerceapp/Components/ComponentsSizes/PageTitleComponentSizes.dart';
import 'package:ecommerceapp/Utils/ScreenConfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget PageTitleComponent(String title, BuildContext context) {
  ScreenConfig screenConfig = ScreenConfig(context);
  PageTitleComponentSizes pageTitleComponentSizes = PageTitleComponentSizes(screenConfig);
  return Text(
    title,
    style: GoogleFonts.bebasNeue(
      fontSize: pageTitleComponentSizes.TitleFontSize,
      color: Colors.black
    ),
  );
}
