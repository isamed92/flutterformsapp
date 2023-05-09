import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register_cubic/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo usuario')),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlutterLogo(
                  size: 100,
                ),
                _RegisterForm(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;

    return Form(
        child: Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de usuario',
            onChange: registerCubit.usernameChanged,
            errorMessage: username.errorMessage,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'correo electronico',
            onChange: registerCubit.emailChanged,
            errorMessage: email.errorMessage,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'contraseña',
            obscureText: true,
            onChange: registerCubit.passwordChanged,
            errorMessage: password.errorMessage,
          ),
          const SizedBox(
            height: 20,
          ),
          FilledButton.tonalIcon(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(2),
                textStyle:
                    MaterialStateProperty.all(const TextStyle(fontSize: 20)),
                minimumSize: MaterialStateProperty.all(Size(size.width, 55))),
            onPressed: () {
              registerCubit.onSubmit();
              // print('email: $email, password: $password, username: $username');
            },
            label: Text('Crear Usuario'.toUpperCase()),
            icon: const Icon(Icons.save),
          ),
        ],
      ),
    ));
  }
}
