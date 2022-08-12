
import 'package:bloc_tutorials/model/form_validation_model/email.dart';
import 'package:bloc_tutorials/model/form_validation_model/password.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class MyFormState extends Equatable {
  const MyFormState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
  });

  final Email email;
  final Password password;
  final FormzStatus status;

  MyFormState copyWith({
    Email? email,
    Password? password,
    FormzStatus? status,
  }) {
    return MyFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, password, status];
}
