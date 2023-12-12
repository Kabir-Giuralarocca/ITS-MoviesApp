import 'package:flutter/material.dart';
import 'package:movies_app/ui/screens/home_screen.dart';
import 'package:movies_app/ui/screens/login_screen.dart';
import 'package:movies_app/ui/screens/movies_screen.dart';
import 'package:movies_app/ui/screens/register_screen.dart';
import 'package:movies_app/ui/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: AppTheme.theme,
      onGenerateRoute: (settings) {
        var routName = settings.name;
        var args = settings.arguments;

        var routes = {
          "/login": (context) => const LoginScreen(),
          "/register": (context) => const RegisterScreen(),
          "/home": (context) => const HomeScreen(),
          "/movies": (context) =>
              MoviesScreen(showtopRated: args as bool? ?? false),
        };

        WidgetBuilder builder =
            routes[routName] ?? (context) => const LoginScreen();

        return MaterialPageRoute(builder: (context) => builder(context));
      },
      // initialRoute: "/login",
      // routes: {
      //   "/login": (context) => const LoginScreen(),
      //   "/register": (context) => const RegisterScreen(),
      //   "/home": (context) => const HomeScreen(),
      //   "/movies": (context) => const MoviesScreen(showtopRated: false,),
      // },
    );
  }
}
