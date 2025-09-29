import 'package:flutter/material.dart';
import 'package:neoview/core/constants/sizes.dart';
import 'package:neoview/core/constants/styles.dart';
import 'package:neoview/core/navigation.dart';
import 'package:neoview/widgets/app_button.dart';
import 'package:neoview/widgets/app_drawer.dart';
import 'package:neoview/widgets/drawer_button.dart';
import 'package:neoview/widgets/underline_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppDrawerButton()
      ),
      drawer: AppDrawer(),
      body: SafeArea(
        child: Padding(
          padding: AppPaddings.screen,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              const UnderlineText("Olá, Cliente"),
              Center(child: Padding(
                padding: AppPaddings.bigger,
                child: Image.asset("assets/images/photo_device_1.png"),
              )),
              SizedBox(),
              const Text(
                "Bem-vindo ao aplicativo do NeoView, seu óculos inteligente que transforma acessibilidade em independência.",
                textAlign: TextAlign.justify,
                style: AppTextStyles.mainText,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 16,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            onClick: (context) {
                              AppRoutes.pair.stack(context);
                            },
                            child: const Text("Conectar NeoView")
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            hollow: true,
                            onClick: (context) {
                              AppRoutes.instructions.stack(context);
                            },
                            child: const Text("Manual de Conexão")
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}