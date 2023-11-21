import 'package:flutter/material.dart';
import 'package:movies_app/data/repositories/auth_repository.dart';
import 'package:movies_app/ui/theme/dimens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Home"),
            height_24,
            ElevatedButton.icon(
              onPressed: () => AuthRepository.logout(context),
              icon: const Icon(Icons.logout),
              label: const Text("Esci"),
            )
          ],
        ),
      ),
    );
  }
}
