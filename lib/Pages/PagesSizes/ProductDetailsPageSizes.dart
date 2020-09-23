import 'package:ecommerceapp/Utils/ScreenConfig.dart';

class ProductDetailsPageSizes {
  ScreenConfig screenConfig ;
  double BrandFontSize ;
  double TitleFontSize ;
  double PriceFontSize ;
  double StockFontSize ;
  double StarsSize ;
  double SectionTitleFonTSize ;
  double DescriptionFontSize ;
  double ButtonHeight ;
  double AddToCartFontSize ;
  double IconSize ;


  ProductDetailsPageSizes(ScreenConfig screenConfig){
    this.screenConfig = screenConfig;
    _init();
  }


  _init (){
    switch(screenConfig.screenType){
      case ScreenTypes.SMALL :
        this.BrandFontSize = 20 ;
        this.TitleFontSize = 16 ;
        this.PriceFontSize = 19 ;
        this.StockFontSize = 12 ;
        this.StarsSize = 19 ;
        this.SectionTitleFonTSize = 20 ;
        this.DescriptionFontSize = 16 ;
        this.ButtonHeight = 47 ;
        this.AddToCartFontSize = 17 ;
        this.IconSize = 23 ;
        break ;
      case ScreenTypes.MEDIUM :
        this.BrandFontSize = 23;
        this.TitleFontSize = 19 ;
        this.PriceFontSize = 22 ;
        this.StockFontSize = 13 ;
        this.StarsSize = 22 ;
        this.SectionTitleFonTSize = 23 ;
        this.DescriptionFontSize = 18 ;
        this.ButtonHeight = 55 ;
        this.AddToCartFontSize = 19 ;
        this.IconSize = 30 ;
        break ;
      case ScreenTypes.LARGE :
        this.BrandFontSize = 25 ;
        this.TitleFontSize = 20 ;
        this.PriceFontSize = 22 ;
        this.StockFontSize = 14 ;
        this.StarsSize = 22 ;
        this.SectionTitleFonTSize = 26 ;
        this.DescriptionFontSize = 19 ;
        this.ButtonHeight = 62 ;
        this.AddToCartFontSize = 21 ;
        this.IconSize = 28 ;
        break ;
      case ScreenTypes.XLARGE :
        this.BrandFontSize = 27 ;
        this.TitleFontSize = 22;
        this.PriceFontSize = 27 ;
        this.StockFontSize = 16 ;
        this.StarsSize = 29 ;
        this.SectionTitleFonTSize = 27 ;
        this.DescriptionFontSize = 20 ;
        this.ButtonHeight = 62 ;
        this.AddToCartFontSize = 22 ;
        this.IconSize = 32 ;
        break ;
    }
  }
}