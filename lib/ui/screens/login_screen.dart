import 'package:flutter/material.dart';
import 'package:movies_app/ui/theme/dimens.dart';
import 'package:movies_app/ui/theme/text_styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        spreadRadius: 5,
                        offset: const Offset(0, 2),
                        blurRadius: 16,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "USERNAME",
                        style: semibold_12.copyWith(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      TextFormField(),
                    ],
                  ),
                ),
                TextFormField(),
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
