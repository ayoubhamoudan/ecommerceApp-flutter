import 'package:ecommerceapp/Utils/ScreenConfig.dart';

class RegisterPageSizes {
  ScreenConfig screenConfig ;
  double ColumnPadding ;
  double TitleFontSize ;
  double  ForgotPasswordFontSize ;
  double ButtonHeight ;
  double ButtonTextFontSize ;
  double AlreadyHaveAccountFontSize ;
  double LoginFontSize ;

  RegisterPageSizes(ScreenConfig screenConfig){
    this.screenConfig = screenConfig ;
    _init();
  }

  _init (){
    switch (this.screenConfig.screenType){
      case ScreenTypes.SMALL:
        this.ColumnPadding = 25 ;
        this.TitleFontSize = 21 ;
        this.ForgotPasswordFontSize = 12 ;
        this.ButtonHeight = 40 ;
        this.ButtonTextFontSize = 18 ;
        this.AlreadyHaveAccountFontSize  = 13.5;
        this.LoginFontSize = 14.5 ;
        break ;
      case ScreenTypes.MEDIUM:
        this.ColumnPadding = 30 ;
        this.TitleFontSize = 26;
        this.ForgotPasswordFontSize = 15 ;
        this.ButtonHeight = 60 ;
        this.ButtonTextFontSize = 21 ;
        this.AlreadyHaveAccountFontSize  = 17;
        this.LoginFontSize = 18 ;
        break ;
      case ScreenTypes.LARGE:
        this.ColumnPadding = 30 ;
        this.TitleFontSize = 27 ;
        this.ForgotPasswordFontSize = 15 ;
        this.ButtonHeight = 60 ;
        this.ButtonTextFontSize = 21 ;
        this.AlreadyHaveAccountFontSize  =  19;
        this.LoginFontSize = 20 ;
        break ;
      case ScreenTypes.XLARGE:
        this.ColumnPadding = 30 ;
        this.TitleFontSize = 27 ;
        this.ForgotPasswordFontSize = 15 ;
        this.ButtonHeight = 60 ;
        this.ButtonTextFontSize = 21 ;
        this.AlreadyHaveAccountFontSize  =  19;
        this.LoginFontSize = 20 ;
        break;
    }
  }
}