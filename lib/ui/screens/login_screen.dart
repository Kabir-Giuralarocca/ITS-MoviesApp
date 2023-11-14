import 'package:flutter/material.dart';
import 'package:movies_app/ui/theme/dimens.dart';
import 'package:movies_app/ui/theme/text_styles.dart';
import 'package:movies_app/ui/widgets/form_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscurePwd = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Column(
              children: [
                const FormInput(
                  label: "USERNAME",
                  hint: "es. MarioRossi",
                  icon: Icons.person,
                ),
                FormInput(
                  label: "PASSWORD",
                  hint: "Password",
                  icon: obscurePwd ? Icons.visibility : Icons.visibility_off,
                  obscureText: obscurePwd,
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
              onPressed: () {},
              child: const Text("Accedi"),
            ),
            height_8,
            OutlinedButton(
              onPressed: () {},
              child: const Text("Registrati"),
            ),
          ],
        ),
      ),
    );
  }
}
