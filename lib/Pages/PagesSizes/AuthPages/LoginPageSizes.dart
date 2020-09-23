import 'package:ecommerceapp/Utils/ScreenConfig.dart';

class LoginPageSizes {
  ScreenConfig screenConfig ;
  double TitleFontSize ;
  double  ForgotPasswordFontSize ;
  double ButtonHeight ;
  double ButtonTextFontSize ;
  double CreateAccountFontSize ;
  double RegisterFontSize ;

  LoginPageSizes(ScreenConfig screenConfig){
    this.screenConfig = screenConfig ;
    _init();
  }

  _init (){
    switch (this.screenConfig.screenType){
      case ScreenTypes.SMALL:
        this.TitleFontSize = 21 ;
        this.ForgotPasswordFontSize = 12 ;
        this.ButtonHeight = 40 ;
        this.ButtonTextFontSize = 18 ;
        this.CreateAccountFontSize  = 13.5;
        this.RegisterFontSize = 14.5 ;
        break ;
      case ScreenTypes.MEDIUM:
        this.TitleFontSize = 26;
        this.ForgotPasswordFontSize = 15 ;
        this.ButtonHeight = 60 ;
        this.ButtonTextFontSize = 21 ;
        this.CreateAccountFontSize  = 17;
        this.RegisterFontSize = 18 ;
        break ;
      case ScreenTypes.LARGE:
        this.TitleFontSize = 27 ;
        this.ForgotPasswordFontSize = 15 ;
        this.ButtonHeight = 60 ;
        this.ButtonTextFontSize = 21 ;
        this.CreateAccountFontSize  =  19;
        this.RegisterFontSize = 20 ;
        break ;
      case ScreenTypes.XLARGE:
        this.TitleFontSize = 27 ;
        this.ForgotPasswordFontSize = 15 ;
        this.ButtonHeight = 60 ;
        this.ButtonTextFontSize = 21 ;
        this.CreateAccountFontSize  =  19;
        this.RegisterFontSize = 20 ;
        break;
    }
  }
}