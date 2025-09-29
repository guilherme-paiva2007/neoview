import 'package:flutter/material.dart';
import 'package:neoview/core/constants/colors.dart';
import 'package:neoview/core/constants/sizes.dart';
import 'package:neoview/core/constants/styles.dart';
import 'package:neoview/core/navigation.dart';
import 'package:neoview/widgets/app_button.dart';
import 'package:neoview/widgets/app_drawer.dart';
import 'package:neoview/widgets/drawer_button.dart';
import 'package:neoview/widgets/underline_text.dart';

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
        actions: [
          AppButton(onClick: (context) {
            AppRoutes.pair.popAndStack(context);
          }, child: const Text("Conectar NeoView")),
          SizedBox(
            width: kScreenPadding,
          )
        ],
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: AppPaddings.screen,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 16,
                  children: [
                    const UnderlineText("Manual de Conexão"),
                    Image.asset("assets/images/photo_device_1.png", width: double.infinity,),
                    const UnderlineText("Conheça mais sobre o NeoView"),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                        "O NeoView é um óculos inteligente desenvolvido para pessoas com deficiência visual. Utilizando visão computacional e recursos de acessibilidade, ele auxilia em tarefas do dia a dia, promovendo mais autonomia, segurança e inclusão.O NeoView é um óculos inteligente desenvolvido para pessoas com deficiência visual. Utilizando visão computacional e recursos de acessibilidade, ele auxilia em tarefas do dia a dia, promovendo mais autonomia, segurança e inclusão.",
                        style: AppTextStyles.mainText,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: AppColors.lightBlue,
              width: double.infinity,
              padding: const EdgeInsets.all(32),
              child: SafeArea(
                top: false,
                child: Column(
                  spacing: 32,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const UnderlineText("Passo a passo"),
                    const _InstructionCard(
                      title: "1. Ligue o NeoView",
                      text: "Pressione o botão lateral até ouvir o sinal sonoro."
                    ),
                    const _InstructionCard(
                      title: "2. Ative o Wi-Fi do celular",
                      text: "Entre nas configurações e verifique as redes disponíveis."
                    ),
                    const _InstructionCard(
                      title: "3. Abra o aplicativo NeoView",
                      text: "Entre em Conectar NeoView e procure pela rede do seu óculos."
                    ),
                    const _InstructionCard(
                      title: "4. Selecione seu óculos",
                      text: "Conecte-se ao seu óculos, exibindo uma nova tela com suas informações."
                    ),
                    const _InstructionCard(
                      title: "5. Conexão concluída!",
                      text: "Seu óculos já está pronto para ser usado."
                    ),
                    const SizedBox(),
                    Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            onClick: (context) {
                              
                            },
                            child: const Text("Conectar NeoView")
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _InstructionCard extends StatelessWidget {
  final String title;
  final String text;

  const _InstructionCard({
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: AppBorderRadius.medium,
      ),
      padding: AppPaddings.bigger,
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),),
          Text(text, style: AppTextStyles.mainText,),
        ],
      ),
    );
  }
}