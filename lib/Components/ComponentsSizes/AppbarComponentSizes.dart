import 'package:ecommerceapp/Utils/ScreenConfig.dart';

class AppbarComponentSizes {
  ScreenConfig screenConfig;

  double TitleFontSize;

  double MenuIconSize;

  double SearchIconSize;

  double CartIconSize;

  AppbarComponentSizes(ScreenConfig screenConfig) {
    this.screenConfig = screenConfig;
    _init();
  }

  _init() {
    switch (this.screenConfig.screenType) {
      case ScreenTypes.SMALL:
        this.TitleFontSize = 26;
        this.MenuIconSize = 21 ;
        this.SearchIconSize = 21 ;
        this.CartIconSize = 24 ;
        break;
      case ScreenTypes.MEDIUM:
        this.TitleFontSize = 28;
        this.MenuIconSize = 24 ;
        this.SearchIconSize = 24 ;
        this.CartIconSize = 28 ;
        break;
      case ScreenTypes.LARGE:
        this.TitleFontSize = 28;
        this.MenuIconSize = 24 ;
        this.SearchIconSize = 24 ;
        this.CartIconSize = 28 ;
        break;
      case ScreenTypes.XLARGE:
        this.TitleFontSize = 31;
        this.MenuIconSize = 26 ;
        this.SearchIconSize = 26 ;
        this.CartIconSize = 30 ;
        break;
    }
  }
}
