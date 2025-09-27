import 'package:flutter/material.dart';
import 'package:neoview/core/navigation.dart';
import 'package:neoview/widgets/app_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Login"),
            AppButton(onClick: (context) {
              AppRoutes.register.stack(context);
            }, child: const Text("Registro")),
            AppSquaredButton(onClick: (context) {}, icon: FontAwesomeIcons.check)
          ],
        ),
      ),
    );
  }
}