import 'package:ecommerceapp/Utils/ScreenConfig.dart';

class DrawerComponentSizes {
  ScreenConfig screenConfig ;
  double TitleFontSize ;
  double IconFontSize ;

  DrawerComponentSizes (ScreenConfig screenConfig){
    this.screenConfig = screenConfig ;
    _init();
  }

  _init (){
    switch (this.screenConfig.screenType){
      case ScreenTypes.SMALL :
        this.TitleFontSize = 23 ;
        this.IconFontSize = 20 ;
        break ;
      case ScreenTypes.MEDIUM :
        this.TitleFontSize = 28 ;
        this.IconFontSize = 23 ;
        break ;
      case ScreenTypes.LARGE :
        this.TitleFontSize = 31 ;
        this.IconFontSize = 25 ;
        break ;
      case ScreenTypes.XLARGE :
        this.TitleFontSize = 31 ;
        this.IconFontSize = 25 ;
        break ;
    }
  }
}