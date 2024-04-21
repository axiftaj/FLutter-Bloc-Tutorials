part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, error }

class LoginState extends Equatable {
  const LoginState({this.email = '', this.password = '', this.message = '', this.loginStatus = LoginStatus.initial});

  final String email;
  final String password;
  final String message;
  final LoginStatus loginStatus;

  LoginState copyWith({
    String? email,
    String? password,
    String? message,
    LoginStatus? loginStatus,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
      loginStatus: loginStatus ?? this.loginStatus,
    );
  }

  @override
  List<Object> get props => [email, password, message, loginStatus];
}
