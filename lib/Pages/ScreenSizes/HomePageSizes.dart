import 'package:ecommerceapp/Utils/ScreenConfig.dart';

class HomePageSizes {
  ScreenConfig screenConfig;
  double SliderTextFontSize ;
  double  ButtonTextFontSize ;
  double SectionTitleFontSize ;
  double SeeMoreFontSize ;
  double ChildRatio ;
  HomePageSizes(ScreenConfig screenConfig){
    this.screenConfig = screenConfig ;
    _init();
  }

  _init (){
    switch (this.screenConfig.screenType){
      case ScreenTypes.SMALL:
        this.SliderTextFontSize = 27 ;
        this.ButtonTextFontSize = 14 ;
        this.SectionTitleFontSize = 18 ;
        this.SeeMoreFontSize = 14 ;
        this.ChildRatio = 0.54;
        break;
      case ScreenTypes.MEDIUM:
        this.SliderTextFontSize = 33 ;
        this.ButtonTextFontSize = 17 ;
        this.SectionTitleFontSize = 22 ;
        this.SeeMoreFontSize = 16 ;
        this.ChildRatio = 0.47 ;
        break ;
      case ScreenTypes.LARGE:
        this.SliderTextFontSize = 38 ;
        this.ButtonTextFontSize = 19 ;
        this.SectionTitleFontSize = 24 ;
        this.SeeMoreFontSize = 16 ;
        this.ChildRatio = 0.47 ;
        break ;
      case ScreenTypes.XLARGE:
        this.SliderTextFontSize = 38 ;
        this.ButtonTextFontSize = 19 ;
        this.SectionTitleFontSize = 24 ;
        this.SeeMoreFontSize = 16 ;
        this.ChildRatio = 0.58;
        break ;
    }
  }
}