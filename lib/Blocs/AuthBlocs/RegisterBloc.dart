import 'package:ecommerceapp/Apis/AuthApi.dart';
import 'package:ecommerceapp/Interfaces/Disposable.dart';
import 'package:ecommerceapp/Validations/AuthValidations.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc implements Disposable {
  AuthValidations authValidations = AuthValidations();
  AuthApi authApi = AuthApi();
  bool loading;
  String error;


  final BehaviorSubject <String> _nameController = BehaviorSubject<String>();
  Stream <String> get name => _nameController.stream.transform(authValidations.validateName) ;
  Function(String) get changeName => _nameController.sink.add ;


  final BehaviorSubject<String> _emailController = BehaviorSubject <String> ();
  Stream<String> get email => _emailController.stream.transform(authValidations.validateEmail);
  Function (String) get changeEmail => _emailController.sink.add;

  final BehaviorSubject<String> _passwordController = BehaviorSubject <String> ();
  Stream <String> get password => _passwordController.stream.transform(authValidations.validatePassword) ;
  Function(String) get changePassword => _passwordController.sink.add ;

  Stream <bool> get isValid => Rx.combineLatest3(name, email, password, (name, email, password) => true);

  final BehaviorSubject<String> _errorController = BehaviorSubject<String>();

  Stream<String> get errorStream => _errorController.stream;

  final BehaviorSubject<bool> _isLoadingController = BehaviorSubject<bool>();

  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  RegisterBloc() {
    this.loading = false;
    _isLoadingController.add(this.loading);
  }

  Future register(Function NavigateTo) async {
    String name = _nameController.value;
    String email = _emailController.value;
    String password = _passwordController.value;
    _isLoadingController.add(true);
    var response = await authApi.register(email , password , name);
    if (response['success']) {
      NavigateTo();
      _errorController.value = null ;
    } else {
      this.error = response['error'];
      _errorController.sink.addError(this.error);
      _isLoadingController.add(false);
    }
  }


  @override
  void dispose() {
    _emailController.close();
    _emailController.close();
    _passwordController.close();
    _errorController.close();
    _isLoadingController.close();
  }
}