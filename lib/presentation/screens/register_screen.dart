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

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final registerCubit = context.watch<RegisterCubit>();
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              CustomTextFormField(
                label: 'Nombre de usuario',
                onChange: (value) {
                  registerCubit.usernameChanged(value);
                  _formKey.currentState?.validate();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El nombre de usuario es requerido';
                  }
                  if (value.trim().isEmpty) {
                    return 'El nombre de usuario es requerido';
                  }
                  if (value.length < 6) {
                    return 'El nombre de usuario debe tener al menos 6 caracteres';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                label: 'correo electronico',
                onChange: (value) {
                  registerCubit.emailChanged(value);
                  _formKey.currentState?.validate();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El nombre de usuario es requerido';
                  }
                  if (value.trim().isEmpty) {
                    return 'El nombre de usuario es requerido';
                  }
                  final emailRegExp = RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  );

                  if (!emailRegExp.hasMatch(value)) {
                    return 'error de formato en el correo';
                  }

                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                label: 'contraseña',
                obscureText: true,
                onChange: (value) {
                  registerCubit.passwordChanged(value);
                  _formKey.currentState?.validate();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El nombre de usuario es requerido';
                  }
                  if (value.trim().isEmpty) {
                    return 'El nombre de usuario es requerido';
                  }
                  if (value.length < 6) {
                    return 'El nombre de usuario debe tener al menos 6 caracteres';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              FilledButton.tonalIcon(
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(2),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 20)),
                    minimumSize:
                        MaterialStateProperty.all(Size(size.width, 55))),
                onPressed: () {
                  final isValid = _formKey.currentState!.validate();
                  if (!isValid) return;
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
