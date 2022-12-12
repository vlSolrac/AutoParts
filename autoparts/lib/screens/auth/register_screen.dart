import 'package:autoparts/providers/providers.dart';
import 'package:autoparts/routes/routes_app.dart';
import 'package:autoparts/services/services.dart';
import 'package:autoparts/themes/themes.dart';
import 'package:autoparts/ui/input_decorations.dart';
import 'package:autoparts/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
//Parametes.

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //global variables.
    final size = MediaQuery.of(context).size;
    // final statusBar = MediaQuery.of(context).viewPadding;

    return Scaffold(
      body: LoginBackground(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("SIGN UP",
                        style: Theme.of(context).textTheme.headline4),
                    SizedBox(height: size.height * 0.05),
                    ChangeNotifierProvider(
                      create: (_) => RegisterFormProvider(),
                      child: _RegisterForm(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.05),
              GestureDetector(
                onTap: () =>
                    Navigator.popAndPushNamed(context, RoutesApp.login),
                child: Text(
                  ConstApp.englishConst["login_dont_exist"],
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<RegisterFormProvider>(context);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.38,
      child: Form(
        key: registerForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'john.doe@gmail.com',
                    labelText: 'Correo electrónico',
                    prefixIcon: Icons.alternate_email_rounded),
                onChanged: (value) => registerForm.email = value,
                validator: (value) {
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = RegExp(pattern);

                  return regExp.hasMatch(value ?? '')
                      ? null
                      : 'El valor ingresado no luce como un correo';
                },
              ),
              const SizedBox(height: 30),
              TextFormField(
                autocorrect: false,
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecorations.authInputDecoration(
                    hintText: '*****',
                    labelText: 'Contraseña',
                    prefixIcon: Icons.lock_outline),
                onChanged: (value) => registerForm.password = value,
                validator: (value) {
                  return (value != null && value.length >= 6)
                      ? null
                      : 'La contraseña debe de ser de 6 caracteres';
                },
              ),
              const SizedBox(height: 30),
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecoration(
                    hintText: '871114556',
                    labelText: 'Cel Phone',
                    prefixIcon: Icons.phone),
                onChanged: (value) => registerForm.celphone = value,
                // validator: (value) {
                //   String pattern =
                //       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                //   RegExp regExp = RegExp(pattern);

                //   return regExp.hasMatch(value ?? '')
                //       ? null
                //       : 'El valor ingresado no luce como un correo';
                // },
              ),
              const SizedBox(height: 30),
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.text,
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'Carlos',
                    labelText: 'Name',
                    prefixIcon: Icons.person),
                onChanged: (value) => registerForm.name = value,
                // validator: (value) {
                //   String pattern =
                //       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                //   RegExp regExp = RegExp(pattern);

                //   return regExp.hasMatch(value ?? '')
                //       ? null
                //       : 'El valor ingresado no luce como un correo';
                // },
              ),
              const SizedBox(height: 30),
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.text,
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'Vela',
                    labelText: 'Middle Name',
                    prefixIcon: Icons.person),
                onChanged: (value) => registerForm.middlename = value,
                // validator: (value) {
                //   String pattern =
                //       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                //   RegExp regExp = RegExp(pattern);

                //   return regExp.hasMatch(value ?? '')
                //       ? null
                //       : 'El valor ingresado no luce como un correo';
                // },
              ),
              const SizedBox(height: 30),
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.text,
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'vlSolrac',
                    labelText: 'Nickname',
                    prefixIcon: Icons.person_pin_rounded),
                onChanged: (value) => registerForm.nickname = value,
                // validator: (value) {
                //   String pattern =
                //       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                //   RegExp regExp = RegExp(pattern);

                //   return regExp.hasMatch(value ?? '')
                //       ? null
                //       : 'El valor ingresado no luce como un correo';
                // },
              ),
              const SizedBox(height: 30),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: ThemeApp.primary,
                onPressed: registerForm.isLoading
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();

                        final authServices =
                            Provider.of<AuthService>(context, listen: false);

                        if (!registerForm.isValidForm()) return;

                        registerForm.isLoading = true;

                        final bool res = await authServices.createUser(
                            email: registerForm.email,
                            password: registerForm.password,
                            celphone: registerForm.celphone,
                            name: registerForm.name,
                            middlename: registerForm.middlename,
                            nickname: registerForm.nickname);

                        if (res) {
                          // ignore: use_build_context_synchronously
                          Navigator.popAndPushNamed(context, RoutesApp.home);
                        } else {
                          // NotificationService.showSnackbar(res);
                          registerForm.isLoading = false;
                        }
                      },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text(
                    registerForm.isLoading ? 'Espere' : 'Ingresar',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
