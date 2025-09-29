import 'package:flutter/material.dart';
import 'package:neoview/core/navigation.dart';
import 'package:neoview/widgets/app_button.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppButton(onClick: (context) {
          AppRoutes.pop(context);
        }, child: const Text("Voltar")),
      ),
    );
  }
}