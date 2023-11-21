import 'package:flutter/material.dart';
import 'package:movies_app/data/repositories/auth_repository.dart';
import 'package:movies_app/domain/models/login_model.dart';
import 'package:movies_app/ui/theme/dimens.dart';
import 'package:movies_app/ui/theme/text_styles.dart';
import 'package:movies_app/ui/utils/validators.dart';
import 'package:movies_app/ui/widgets/form_input.dart';
import 'package:movies_app/ui/widgets/loading_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscurePwd = true;
  bool showLoader = false;
  final _formKey = GlobalKey<FormState>();
  final username = TextEditingController();
  final password = TextEditingController();

  void _showLoader(bool show) => setState(() => showLoader = show);

  void _login() {
    _showLoader(true);
    AuthRepository.login(
      LoginModel(username: username.text, password: password.text),
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
        body: ListView(
          padding: const EdgeInsets.fromLTRB(16, 84, 16, 16),
          children: [
            Text(
              "Accedi",
              style: bold_36,
            ),
            Text(
              "Inserisci le tue credenziali per poter accedere all’applicazione.",
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
            )
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    _login();
                  }
                },
                child: const Text("Accedi"),
              ),
              height_8,
              OutlinedButton(
                onPressed: () => Navigator.pushNamed(context, "/register"),
                child: const Text("Registrati"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
