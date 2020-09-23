import 'package:ecommerceapp/Utils/ScreenConfig.dart';

class CollectionProductsPageSizes {
  ScreenConfig screenConfig;
  double ChildRatio ;
  CollectionProductsPageSizes(ScreenConfig screenConfig){
    this.screenConfig = screenConfig ;
    _init();
  }

  _init (){
    switch (this.screenConfig.screenType){
      case ScreenTypes.SMALL:
        this.ChildRatio = 0.62;
        break;
      case ScreenTypes.MEDIUM:
        this.ChildRatio = 0.55 ;
        break ;
      case ScreenTypes.LARGE:
        this.ChildRatio = 0.54 ;
        break ;
      case ScreenTypes.XLARGE:
        this.ChildRatio = 0.69;
        break ;
    }
  }
}