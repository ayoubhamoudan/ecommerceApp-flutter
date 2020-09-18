import 'package:flutter/cupertino.dart';

enum ScreenTypes {
 XLARGE, LARGE , MEDIUM , SMALL
}

class ScreenConfig {
  double ScreenHeight , ScreenWidth ;
  BuildContext context ;
  ScreenTypes screenType ;
  ScreenConfig (BuildContext context){
    this.ScreenHeight = MediaQuery.of(context).size.height ;
    this.ScreenWidth = MediaQuery.of(context).size.width ;
    _setScreen();
  }

  _setScreen(){
    if ( this.ScreenWidth >= 320 && this.ScreenWidth < 360 ){
      this.screenType = ScreenTypes.SMALL ;
    }
    if( this.ScreenWidth >= 360 && this.ScreenWidth < 400 ){
      this.screenType = ScreenTypes.MEDIUM ;
    }
    if ( this.ScreenWidth >= 400  && this.ScreenWidth < 440 ){
      this.screenType = ScreenTypes.LARGE ;
    }
    if ( this.ScreenWidth >= 440  ){
      this.screenType = ScreenTypes.XLARGE ;
    }
  }
}