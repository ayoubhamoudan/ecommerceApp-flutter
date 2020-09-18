import 'package:ecommerceapp/Interfaces/Disposable.dart';
import 'package:ecommerceapp/Validations/AuthValidations.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc implements Disposable {

  AuthValidations authValidations = AuthValidations();

  final BehaviorSubject<String> _emailController = BehaviorSubject <String> ();
  Stream<String> get email => _emailController.stream.transform(authValidations.validateEmail);
  Function (String) get changeEmail => _emailController.sink.add;

  final BehaviorSubject<String> _passwordController = BehaviorSubject <String> ();
  Stream <String> get password => _passwordController.stream.transform(authValidations.validatePassword) ;
  Function(String) get changePassword => _passwordController.sink.add ;

  Stream <bool> get isValid => Rx.combineLatest2(email, password, (email , password) => true);



  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
  }

}