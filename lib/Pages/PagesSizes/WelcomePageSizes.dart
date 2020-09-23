import 'package:ecommerceapp/Utils/ScreenConfig.dart';

class WelcomePageSizes {
  ScreenConfig screenConfig;
  double TextFontSize ;
  double ButtonTextFontSize ;
  double ButtonHeight ;
  WelcomePageSizes(ScreenConfig screenConfig){
    this.screenConfig = screenConfig ;
    _init();
  }

  _init (){
    switch (this.screenConfig.screenType){
      case ScreenTypes.SMALL:
        this.TextFontSize = 24 ;
        this.ButtonTextFontSize = 19 ;
        this.ButtonHeight = 50 ;
        break;
      case ScreenTypes.MEDIUM:
        this.TextFontSize = 31;
        this.ButtonTextFontSize = 22 ;
        this.ButtonHeight = 55 ;
        break ;
      case ScreenTypes.LARGE:
        this.TextFontSize = 34 ;
        this.ButtonTextFontSize = 22 ;
        this.ButtonHeight = 62 ;
        break ;
      case ScreenTypes.XLARGE:
        this.TextFontSize = 34 ;
        this.ButtonTextFontSize = 22 ;
        this.ButtonHeight = 62 ;
        break ;
    }
  }
}