import 'package:ecommerceapp/Utils/ScreenConfig.dart';

class AllCollectionsPageSizes {
  ScreenConfig screenConfig ;
  double NameFontSize ;
  double DescriptionFontSize ;
  double ButtonTextFontSize ;

  AllCollectionsPageSizes (ScreenConfig screenConfig){
    this.screenConfig = screenConfig ;
    _init();
  }

  _init (){
    switch (this.screenConfig.screenType){
      case ScreenTypes.SMALL:
        this.NameFontSize = 45 ;
        this.DescriptionFontSize = 16 ;
        this.ButtonTextFontSize = 15 ;
        break;
      case ScreenTypes.MEDIUM:
        this.NameFontSize = 53 ;
        this.DescriptionFontSize = 18 ;
        this.ButtonTextFontSize = 18 ;
        break ;
      case ScreenTypes.LARGE:
        this.NameFontSize = 66 ;
        this.DescriptionFontSize = 20 ;
        this.ButtonTextFontSize = 20 ;
        break ;
      case ScreenTypes.XLARGE:
        this.NameFontSize = 66 ;
        this.DescriptionFontSize = 22 ;
        this.ButtonTextFontSize = 21 ;
        break ;
    }
  }
}