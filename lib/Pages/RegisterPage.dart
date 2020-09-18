import 'package:ecommerceapp/Blocs/AuthBlocs/RegisterBloc.dart';
import 'ScreenSizes/AuthPages/RegisterPageSizes.dart';
import 'package:ecommerceapp/Utils/ScreenConfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'LoginPage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterBloc registerBloc = RegisterBloc();
  
  @override
  void dispose() {
    super.dispose();
    registerBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenConfig screenConfig = ScreenConfig(context);
    RegisterPageSizes registerPageSizes = RegisterPageSizes(screenConfig);
    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: registerPageSizes.ColumnPadding , vertical: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _drawSizedBox(height * 0.2),
              _title(registerPageSizes.TitleFontSize),
              _drawSizedBox(height * 0.05),
              _nameInput(),
              _drawSizedBox(height * 0.04),
              _emailInput(),
              _drawSizedBox(height * 0.04),
              _passwordInput(),
              _drawSizedBox(height * 0.07),
              _registerButton(registerPageSizes.ButtonHeight , registerPageSizes.ButtonTextFontSize),
              _drawSizedBox(height * 0.05),
              _loginText(registerPageSizes.AlreadyHaveAccountFontSize, registerPageSizes.LoginFontSize)
            ],
          ),
        ),
      ),
    );
  }


  Widget _title(double fontSize) {
    return Text(
      'Create an Account !',
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _nameInput() {
    return StreamBuilder(
        stream: registerBloc.name,
        builder: (context, snapshot) {
          return TextField(
            onChanged: registerBloc.changeName,
            decoration: InputDecoration(
                hintText: 'Your Full name', errorText: snapshot.error),
            keyboardType: TextInputType.text,
          );
        });
  }

  Widget _emailInput() {
    return StreamBuilder(
        stream: registerBloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: registerBloc.changeEmail,
            decoration: InputDecoration(
                hintText: 'Email Address', errorText: snapshot.error),
            keyboardType: TextInputType.emailAddress,
          );
        });
  }

  Widget _passwordInput() {
    return StreamBuilder(
        stream: registerBloc.password,
        builder: (context, snapshot) {
          return TextField(
            onChanged: registerBloc.changePassword,
            decoration: InputDecoration(
              labelText: 'Password',
              errorText: snapshot.error,
            ),
            keyboardType: TextInputType.emailAddress,
            obscureText: true,
          );
        });
  }

  Widget _registerButton(double ButtonHeight , fontSize) {
    return StreamBuilder<Object>(
        stream: registerBloc.isValid,
        builder: (context, snapshot) {
          return SizedBox(
            width: double.infinity,
            height: ButtonHeight,
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text(
                'Register',
                style: TextStyle(color: Colors.white, fontSize: fontSize),
              ),
              onPressed: !snapshot.hasData ? null : () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6))),
            ),
          );
        });
  }

  Widget _loginText(double alreadyHaveAccountFontSize , loginFontSize ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Already have an account ?",
          style: GoogleFonts.poppins(fontSize: alreadyHaveAccountFontSize),
        ),
        FlatButton(
          child: Text(
            'Log In',
            style:
                GoogleFonts.poppins(fontSize: loginFontSize, fontWeight: FontWeight.w600),
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
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
}
