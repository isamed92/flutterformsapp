part of 'register_cubit.dart';

enum FormStatus { valid, invalid, validating }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final String username;
  final String email;
  final String password;

  const RegisterFormState(
      {this.formStatus = FormStatus.invalid,
      this.username = '',
      this.email = '',
      this.password = ''});

  RegisterFormState copyWith(
          {FormStatus? formStatus,
          String? username,
          String? email,
          String? password}) =>
      RegisterFormState(
          email: email ?? this.email,
          username: username ?? this.username,
          password: password ?? this.password,
          formStatus: formStatus ?? this.formStatus);
  @override
  List<Object> get props => [formStatus, username, email, password];
}
