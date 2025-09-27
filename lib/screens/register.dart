import 'package:flutter/material.dart';
import 'package:neoview/core/navigation.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Registro"),
            ElevatedButton(onPressed: () {
              AppRoutes.pop(context);
            }, child: const Text("Voltar"))
          ],
        ),
      ),
    );
  }
}