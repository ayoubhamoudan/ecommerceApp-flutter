import 'package:ecommerceapp/Utils/ScreenConfig.dart';

class ListItemSizes {
  ScreenConfig screenConfig ;
  double TitleFontSize ;
  double BrandFontSize ;
  double PriceFontSize ;
  double GridListHeight ;

  ListItemSizes (ScreenConfig screenConfig){
    this.screenConfig = screenConfig ;
    _init();
  }


  _init (){
    switch (screenConfig.screenType){
      case ScreenTypes.SMALL:
        this.TitleFontSize = 12 ;
        this.BrandFontSize = 17 ;
        this.PriceFontSize = 14;
        this.GridListHeight = 1 ;
        break ;
      case ScreenTypes.MEDIUM:
        this.TitleFontSize = 14 ;
        this.BrandFontSize = 19 ;
        this.PriceFontSize = 16;
        this.GridListHeight = 0.9 ;
        break ;
      case ScreenTypes.LARGE:
        this.TitleFontSize = 16 ;
        this.BrandFontSize = 20 ;
        this.PriceFontSize = 18;

        break ;
    }
  }
}