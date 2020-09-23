import 'package:device_preview/device_preview.dart';
import 'package:ecommerceapp/Pages/LoginPage.dart';
import 'package:ecommerceapp/pages/WelcomePage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './pages/HomePage.dart';

main () async{
  WidgetsFlutterBinding.ensureInitialized();
  Widget firstPage = HomePage();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isSeen = prefs.getBool('isSeen');
  if (isSeen == false || isSeen == null){
    firstPage = WelcomePage();
  }
  runApp(
    DevicePreview(
      builder: (context) => Fasho(firstPage)
    ),
//    Fasho(firstPage)
  );
}



class Fasho extends StatelessWidget {
  Widget firstPage ;
  Fasho(this.firstPage);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: this.firstPage,
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
