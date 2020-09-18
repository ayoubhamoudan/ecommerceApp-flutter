import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget loadingWidget() {
  return Container(
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

Widget noConnectionWidget() {
  return Center(
    child: Text(
      'No Connection',
      style: GoogleFonts.poppins(
        textStyle: TextStyle(fontSize: 19),
      ),
    ),
  );
}

Widget errorWidget(String error) {
  return Container(
    child: Center(
      child: Text(
        error,
        style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 19)),
      ),
    ),
  );
}


Widget noDataWidget() {
  return Container(
    child: Center(
      child: Text(
        'No Data',
        style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 19)),
      ),
    ),
  );
}

Widget emptyDataWidget(String resource) {
  return Container(
    child: Center(
      child: Text(
        resource,
        style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 19)),
      ),
    ),
  );
}
