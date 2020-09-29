import 'package:ecommerceapp/Utils/ScreenConfig.dart';

class CartPageSizes {
  ScreenConfig screenConfig ;
  double ButtonHeight ;
  double ButtonTextFontSize ;
  double TotalPriceFontSize ;

  CartPageSizes(ScreenConfig screenConfig){
    this.screenConfig = screenConfig ;
    _init();
  }

  _init (){
    switch (screenConfig.screenType){
      case ScreenTypes.SMALL:
        this.ButtonHeight = 47 ;
        this.ButtonTextFontSize = 17 ;
        break ;
      case ScreenTypes.MEDIUM :
        this.ButtonHeight = 55 ;
        this.ButtonTextFontSize = 19 ;
        break;
      case ScreenTypes.LARGE:
        this.ButtonHeight = 62 ;
        this.ButtonTextFontSize = 21 ;
        break ;
      case ScreenTypes.XLARGE:
        this.ButtonHeight = 62 ;
        this.ButtonTextFontSize = 22 ;
        break ;
    }
  }
}