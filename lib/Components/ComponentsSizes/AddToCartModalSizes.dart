import 'package:ecommerceapp/Utils/ScreenConfig.dart';

class AddToCartModalSizes {

  ScreenConfig screenConfig ;
  double ImageWidth ;
  double BrandFontSize ;
  double TitleFontSize ;
  double PriceFontSize ;
  double ButtonHeight ;
  double AddToCartFontSize ;
  double IconSize ;
  double FinalPriceFontSize ;
  double SectionTitleFonTSize ;
  double SizeContainerWidth ;
  double SizeContainerHeigth ;
  double SizeFontSize ;
  double QuantityFontSize ;
  double AvatarRadius ;

  AddToCartModalSizes(ScreenConfig screenConfig){
    this.screenConfig = screenConfig ;
    _init();
  }

  _init(){
    switch (screenConfig.screenType){
      case ScreenTypes.SMALL:
        this.ImageWidth = 0.35 ;
        this.BrandFontSize = 20 ;
        this.TitleFontSize = 16 ;
        this.ButtonHeight = 47 ;
        this.AddToCartFontSize = 17 ;
        this.IconSize = 23 ;
        this.PriceFontSize = 19 ;
        this.SectionTitleFonTSize = 20 ;
        this.SizeContainerHeigth = 35 ;
        this.SizeContainerWidth = 35 ;
        this.SizeFontSize = 16 ;
        this.QuantityFontSize = 33 ;
        this.AvatarRadius =  19 ;
        break ;
      case ScreenTypes.MEDIUM :
        this.ImageWidth = 0.396 ;
        this.BrandFontSize = 23;
        this.TitleFontSize = 19 ;
        this.ButtonHeight = 55 ;
        this.AddToCartFontSize = 19 ;
        this.IconSize = 30 ;
        this.PriceFontSize = 22 ;
        this.SectionTitleFonTSize = 23 ;
        this.SizeContainerHeigth = 50 ;
        this.SizeContainerWidth = 50 ;
        this.SizeFontSize = 23 ;
        this.QuantityFontSize = 40 ;
        this.AvatarRadius =  21 ;
        break;
      case ScreenTypes.LARGE:
        this.ImageWidth = 0.396 ;
        this.BrandFontSize = 25 ;
        this.TitleFontSize = 20 ;
        this.ButtonHeight = 62 ;
        this.AddToCartFontSize = 21 ;
        this.IconSize = 28 ;
        this.PriceFontSize = 22 ;
        this.SectionTitleFonTSize = 26 ;
        this.SizeContainerHeigth = 50 ;
        this.SizeContainerWidth = 50 ;
        this.SizeFontSize = 23 ;
        this.QuantityFontSize = 44 ;
        this.AvatarRadius =  22 ;
        break ;
      case ScreenTypes.XLARGE:
        this.ImageWidth = 0.396 ;
        this.BrandFontSize = 27 ;
        this.TitleFontSize = 22;
        this.ButtonHeight = 62 ;
        this.AddToCartFontSize = 22 ;
        this.IconSize = 32 ;
        this.PriceFontSize = 27 ;
        this.SectionTitleFonTSize = 27 ;
        this.SizeContainerHeigth = 50 ;
        this.SizeContainerWidth = 50 ;
        this.SizeFontSize = 23 ;
        this.QuantityFontSize = 44 ;
        this.AvatarRadius =  22 ;
        break ;
    }
  }
}