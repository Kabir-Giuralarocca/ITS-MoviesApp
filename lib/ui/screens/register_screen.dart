import 'package:flutter/material.dart';
import 'package:movies_app/data/repositories/auth_repository.dart';
import 'package:movies_app/domain/models/register_model.dart';
import 'package:movies_app/ui/theme/text_styles.dart';
import 'package:movies_app/ui/utils/common_widget.dart';
import 'package:movies_app/ui/utils/validators.dart';
import 'package:movies_app/ui/widgets/form_input.dart';
import 'package:movies_app/ui/widgets/loading_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscurePwd = true;
  bool showLoader = false;
  final _formKey = GlobalKey<FormState>();
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  void _showLoader(bool show) => setState(() => showLoader = show);

  void _register() {
    // AuthRepository.register(
    //   RegisterModel(
    //     username: username.text,
    //     email: email.text,
    //     password: password.text,
    //   ),
    // ).then((value) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text("Registrazione avvenuta con successo!")),
    //   );
    // }).onError((error, stackTrace) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text(error.toString())),
    //   );
    // });
    _showLoader(true);
    AuthRepository.registerWithLogin(
      RegisterModel(
        username: username.text,
        email: email.text,
        password: password.text,
      ),
    ).then((value) {
      _showLoader(false);
      Navigator.pushNamed(context, "/home");
    }).onError((error, stackTrace) {
      _showLoader(false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoadingScreen(
        showLoader: showLoader,
        screen: Scaffold(
          appBar: AppBar(),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                "Registrati",
                style: bold_36,
              ),
              Text(
                "Inserisci le tue credenziali per creare il tuo account e poter accedere all’applicazione.",
                style: medium_14,
              ),
              height_24,
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    FormInput(
                      label: "USERNAME",
                      hint: "es. MarioRossi",
                      icon: Icons.person,
                      controller: username,
                    ),
                    FormInput(
                      label: "EMAIL",
                      hint: "es. mario.rossi@mail.it",
                      icon: Icons.mail,
                      validator: emailValidator,
                      controller: email,
                    ),
                    FormInput(
                      label: "PASSWORD",
                      hint: "Password",
                      icon:
                          obscurePwd ? Icons.visibility : Icons.visibility_off,
                      obscureText: obscurePwd,
                      validator: passwordValidator,
                      controller: password,
                      onIconTap: () => setState(() {
                        obscurePwd = !obscurePwd;
                      }),
                    ),
                  ],
                ),
              ),
              height_24,
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    _register();
                  }
                },
                child: const Text("Registrati"),
              ),
            ],
          ),
        ));
  }
}
