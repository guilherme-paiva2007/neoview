import 'package:flutter/material.dart';
import 'package:neoview/core/navigation.dart';
import 'package:neoview/widgets/app_button.dart';
import 'package:neoview/widgets/app_drawer.dart';
import 'package:neoview/widgets/drawer_button.dart';

class Instructions extends StatefulWidget {
  const Instructions({super.key});

  @override
  State<Instructions> createState() => _InstructionsState();
}

class _InstructionsState extends State<Instructions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppDrawerButton(),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Instruções"),
            AppButton(onClick: (context) {
              AppRoutes.pop(context);
            }, child: const Text("Voltar")),
          ],
        ),
      ),
    );
  }
}