import 'package:flutter/material.dart';
import 'package:movies_app/ui/theme/dimens.dart';
import 'package:movies_app/ui/theme/text_styles.dart';
import 'package:movies_app/ui/widgets/form_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscurePwd = true;

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
            child: Column(
              children: [
                const FormInput(
                  label: "USERNAME",
                  hint: "es. MarioRossi",
                  icon: Icons.person,
                ),
                const FormInput(
                  label: "EMAIL",
                  hint: "es. mario.rossi@mail.it",
                  icon: Icons.mail,
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
          ),
          height_24,
          ElevatedButton(
            onPressed: () {},
            child: const Text("Registrati"),
          ),
        ],
      ),
    );
  }
}
