import 'package:flutter/material.dart';
import 'package:neoview/core/navigation.dart';
import 'package:neoview/widgets/app_button.dart';
import 'package:neoview/widgets/app_drawer.dart';
import 'package:neoview/widgets/drawer_button.dart';

class Pair extends StatefulWidget {
  const Pair({super.key});

  @override
  State<Pair> createState() => _PairState();
}

class _PairState extends State<Pair> {
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
            const Text("Conectar"),
            AppButton(onClick: (context) {
              AppRoutes.pop(context);
            }, child: const Text("Voltar")),
          ],
        ),
      ),
    );
  }
}