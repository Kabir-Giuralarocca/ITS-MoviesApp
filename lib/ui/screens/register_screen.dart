import 'package:flutter/material.dart';
import 'package:movies_app/data/repositories/auth_repository.dart';
import 'package:movies_app/domain/models/register_model.dart';
import 'package:movies_app/ui/theme/dimens.dart';
import 'package:movies_app/ui/theme/text_styles.dart';
import 'package:movies_app/ui/utils/validators.dart';
import 'package:movies_app/ui/widgets/form_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscurePwd = true;
  final _formKey = GlobalKey<FormState>();
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

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

    AuthRepository.registerWithLogin(
      RegisterModel(
        username: username.text,
        email: email.text,
        password: password.text,
      ),
    ).then((value) {
      Navigator.pushNamed(context, "/home");
    }).onError((error, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  icon: obscurePwd ? Icons.visibility : Icons.visibility_off,
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
    );
  }
}
