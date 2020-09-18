import 'dart:async';

class AuthValidations {
  final validateName = StreamTransformer<String , String>.fromHandlers(
      handleData: (name , sink){
        if (name.length > 0){
          sink.add(name);
        } else {
          sink.addError('Name is required');
        }
      }
  );
  final validateEmail = StreamTransformer<String , String>.fromHandlers(
      handleData: (email , sink) {
        if(email.contains('@')){
          sink.add(email);
        } else {
          sink.addError('Add an email');
        }

      }
  );
  final validatePassword = StreamTransformer<String , String>.fromHandlers(
      handleData: (password , sink){
        if (password.length > 6){
          sink.add(password);
        } else {
          sink.addError('Password must be 6 characters at least');
        }
      }
  );
}