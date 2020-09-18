import 'package:ecommerceapp/Utils/ScreenConfig.dart';
import 'package:ecommerceapp/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ScreenSizes/WelcomePageSizes.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenConfig screenConfig = ScreenConfig(context);
    WelcomePageSizes welcomePageSizes = WelcomePageSizes(screenConfig);
    print(MediaQuery.of(context).size.width);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Transform.translate(
              offset: Offset(0, MediaQuery.of(context).size.height * 0.4),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.65,
                child: Text(
                  "discover all the new arrivals of the women's collections",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: welcomePageSizes.TextFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 58.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                height: welcomePageSizes.ButtonHeight,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  elevation: 0,
                  color: Colors.black,
                  onPressed: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setBool('isSeen', true);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute( builder: (context) => HomePage()),
                    );
                  },
                  child: Text(
                    'Get Started',
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: welcomePageSizes.ButtonTextFontSize,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
