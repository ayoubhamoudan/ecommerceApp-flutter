import 'package:ecommerceapp/Utils/ScreenConfig.dart';

class PageTitleComponentSizes {
  ScreenConfig screenConfig ;
  double TitleFontSize ;


  PageTitleComponentSizes (ScreenConfig screenConfig){
    this.screenConfig = screenConfig ;
    _init();
  }


  _init (){
    switch (screenConfig.screenType){
      case ScreenTypes.SMALL:
        this.TitleFontSize = 30 ;
        break ;
      case ScreenTypes.MEDIUM:
        this.TitleFontSize = 37 ;
        break ;
      case ScreenTypes.LARGE:
        this.TitleFontSize = 40 ;
        break ;
      case ScreenTypes.XLARGE:
        this.TitleFontSize = 42 ;
        break ;
    }
  }
}