import 'package:ecommerceapp/Blocs/AuthBlocs/RegisterBloc.dart';
import 'package:ecommerceapp/Components/LoadingComponent.dart';
import 'package:ecommerceapp/Utils/ScreenConfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'HomePage.dart';
import 'LoginPage.dart';
import 'PagesSizes/AuthPages/RegisterPageSizes.dart';

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
    return Scaffold(
      body: StreamBuilder(
        stream: registerBloc.isLoadingStream,
        builder: (context, snapshot){
          return snapshot.data == true ? LoadingComponent() : _registerPage(context);
        },
      )
    );
  }


  Widget _registerPage (BuildContext context){
    ScreenConfig screenConfig = ScreenConfig(context);
    RegisterPageSizes registerPageSizes = RegisterPageSizes(screenConfig);
    double height = MediaQuery.of(context).size.height ;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: registerPageSizes.ColumnPadding , vertical: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _drawSizedBox(height * 0.2),
            _title(registerPageSizes.TitleFontSize),
            _errorMessage(),
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
              onPressed: !snapshot.hasData ? null : (){
                registerBloc.register(NavigatTo);
              } ,
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

  Widget _errorMessage (){
    return StreamBuilder(
      stream:  registerBloc.errorStream,
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


  void NavigatTo (){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}
