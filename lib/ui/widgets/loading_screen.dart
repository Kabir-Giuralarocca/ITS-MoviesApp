import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    super.key,
    required this.showLoader,
    required this.screen,
  });

  final bool showLoader;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: showLoader ? 0.3 : 1,
          child: AbsorbPointer(
            absorbing: showLoader,
            child: screen,
          ),
        ),
        Visibility(
          visible: showLoader,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}
