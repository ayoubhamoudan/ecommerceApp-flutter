import 'dart:async';
import 'package:dio/dio.dart';
import 'package:ecommerceapp/Apis/AuthApi.dart';
import 'package:ecommerceapp/Interfaces/Disposable.dart';
import 'package:ecommerceapp/Validations/AuthValidations.dart';
import 'package:rxdart/rxdart.dart';


class LoginBloc implements Disposable {

  AuthApi authApi = AuthApi();
  AuthValidations authValidations = AuthValidations();
  bool isAuth = false ;
  bool loading ;
  String error ;
  String token ;


  final BehaviorSubject<String> _emailController = BehaviorSubject <String> ();
  Stream<String> get email => _emailController.stream.transform(authValidations.validateEmail);
  Function (String) get changeEmail => _emailController.sink.add;

  final BehaviorSubject<String> _passwordController = BehaviorSubject <String> ();
  Stream <String> get password => _passwordController.stream.transform(authValidations.validatePassword) ;
  Function(String) get changePassword => _passwordController.sink.add ;

  Stream <bool> get isValid => Rx.combineLatest2(email, password, (email , password) => true);


  final StreamController <String> _errorController = StreamController<String>();
  Stream <String> get errorStream => _errorController.stream ;

  final StreamController <bool> _isLoadingController = StreamController<bool>();
  Stream <bool> get isLoadingStream => _isLoadingController.stream ;

  final StreamController <bool> _isAuthController =  StreamController<bool>();
  Stream <bool> get isAuthStream => _isAuthController.stream ;

  Future logIn () async {
      String email = _emailController.value ;
      String password = _passwordController.value;
      try {
        var response = await authApi.login(email , password);
        this.token = response.data['token'] ;

      } catch (err){
        this.error = err.response.data['error'];
        _errorController.sink.addError(this.error);
      }
  }

  void logOut (){

  }

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
    _errorController.close();
    _isAuthController.close();
    _isLoadingController.close();
  }

}