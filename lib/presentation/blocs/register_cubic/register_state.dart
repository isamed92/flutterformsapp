part of 'register_cubit.dart';

enum FormStatus { valid, invalid, validating }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final Username username;
  final Email email;
  final Password password;

  const RegisterFormState(
      {this.isValid = false,
      this.formStatus = FormStatus.invalid,
      this.username = const Username.pure(),
      this.email = const Email.pure(),
      this.password = const Password.pure()});

  RegisterFormState copyWith(
          {FormStatus? formStatus,
          Username? username,
          Email? email,
          bool? isValid,
          Password? password}) =>
      RegisterFormState(
          email: email ?? this.email,
          isValid: isValid ?? this.isValid,
          username: username ?? this.username,
          password: password ?? this.password,
          formStatus: formStatus ?? this.formStatus);
  @override
  List<Object> get props => [formStatus, username, email, password, isValid];
}
