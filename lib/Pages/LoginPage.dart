import 'package:ecommerceapp/Blocs/AuthBlocs/LoginBloc.dart';
import 'ScreenSizes/AuthPages/LoginPageSizes.dart';
import 'package:ecommerceapp/Utils/ScreenConfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'RegisterPage.dart';



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc loginBloc = LoginBloc();
  @override
  void dispose() {
    super.dispose();
    loginBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenConfig screenConfig = ScreenConfig(context);
    LoginPageSizes loginPageSizes = LoginPageSizes(screenConfig);
    double height = MediaQuery.of(context).size.height ;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _header(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _errorMessage(),
                  _drawSizedBox(height * 0.03),
                  _title(loginPageSizes.TitleFontSize),
                  _drawSizedBox(height * 0.04),
                  _emailInput(),
                  _drawSizedBox(height * 0.03),
                  _passwordInput(),
                  _drawSizedBox(height * 0.012),
                  _forgotPassword(loginPageSizes.ForgotPasswordFontSize),
                  _drawSizedBox(height * 0.025),
                  _loginButton(loginPageSizes.ButtonHeight, loginPageSizes.ButtonTextFontSize),
                  _drawSizedBox(height * 0.02),
                  _createAccountText(loginPageSizes.CreateAccountFontSize , loginPageSizes.RegisterFontSize)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.33,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage('assets/images/header.jpg'),
              fit: BoxFit.cover)),
    );
  }

  Widget _title(double fontSize) {
    return Text(
      'Welcome Back !',
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _emailInput() {
    return StreamBuilder(
        stream: loginBloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: loginBloc.changeEmail,
            decoration: InputDecoration(
                hintText: 'Email Address',
                errorText: snapshot.error
            ),
            keyboardType: TextInputType.emailAddress,
          );
        }
    );
  }

  Widget _passwordInput() {
    return StreamBuilder(
        stream: loginBloc.password,
        builder: (context, snapshot) {
          return TextField(
            decoration: InputDecoration(
                labelText: 'Password',
                errorText: snapshot.error
            ),
            keyboardType: TextInputType.emailAddress,
            obscureText: true,
            onChanged: loginBloc.changePassword,
          );
        }
    );
  }

  Widget _forgotPassword(double fontSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(),
        FlatButton(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Text(
            'Forgot Password ?',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(fontSize: 15),
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _loginButton(double buttonHeight, double fontSize) {
    return StreamBuilder(
        stream: loginBloc.isValid,
        builder: (context, snapshot) {
          return SizedBox(
            width: double.infinity,
            height: buttonHeight,
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text(
                'Log In',
                style: TextStyle(color: Colors.white, fontSize: fontSize),
              ),
              onPressed: !snapshot.hasData ? null : (){
                loginBloc.logIn();
              } ,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6))),
            ),
          );
        }
    );
  }

  Widget _createAccountText(double createAccountFontSize , registerFontSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Don't have an account ?",
          style: GoogleFonts.poppins(fontSize: createAccountFontSize),
        ),
        FlatButton(
          child: Text(
            'Register',
            style: GoogleFonts.poppins(
              fontSize: registerFontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RegisterPage(),
              ),
            );
          },
        )
      ],
    );
  }

  Widget _drawSizedBox(double boxHeight) {
    return SizedBox(
      height: boxHeight,
    );
  }



  Widget _errorMessage (){
    return StreamBuilder(
      stream:  loginBloc.errorStream,
      builder: (context , snapshot){
        if (snapshot.hasError){
          return Padding(
            padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
            child: Container(
              width: MediaQuery.of(context).size.width,
              color:Color(0xFFe15f41),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(snapshot.error, style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.white
                  ),),
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
