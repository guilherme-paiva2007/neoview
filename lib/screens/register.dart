import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tools/form_validator.dart';
import 'package:flutter_tools/screen_observer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neoview/core/constants/colors.dart';
import 'package:neoview/core/constants/rules.dart';
import 'package:neoview/core/constants/sizes.dart';
import 'package:neoview/core/constants/styles.dart';
import 'package:neoview/core/navigation.dart';
import 'package:neoview/widgets/app_button.dart';
import 'package:neoview/widgets/app_inut.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register>with WidgetsBindingObserver, ScreenObserver {
  final InputSecretController secret = InputSecretController();

  final InputEdittingController<String> nameController = InputEdittingController("", AppRules.name);
  final InputEdittingController<String> emailController = InputEdittingController("", AppRules.email);
  final InputEdittingController<String> passwordController = InputEdittingController("", AppRules.password);

  final FormValidator form = FormValidator();

  @override
  void initState() {
    form.add(emailController);
    form.add(passwordController);
    form.add(nameController);
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    secret.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final upperHeightPart = constraints.maxHeight * .1;
          final upper2 = upperHeightPart * 2.5;
          final keyboardClosed = keyboardState == KeyboardState.closed;
          // TODO: media query (upper2 + svgHeightByRatio > max)
          return SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Stack(
              children: [
                Container(
                  height: keyboardClosed ? upper2 : upperHeightPart,
                  width: constraints.maxWidth,
                  color: AppColors.blue,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 12,
                      children: [
                        Image.asset("assets/icons/white.png", width: 96,),
                        const Text("NEOVIEW", style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  width: constraints.maxWidth,
                  top: (keyboardClosed ? upper2 : upperHeightPart) - 1,
                  child: SvgPicture.asset("assets/svgs/auth_vector.svg", width: constraints.maxWidth,)
                ),
                Positioned(
                  bottom: kDoubleScreenPadding,
                  width: constraints.maxWidth - kDoubleScreenPadding,
                  left: kScreenPadding,
                  height: constraints.maxHeight * (keyboardClosed ? .55 : .7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: AppBorders.underline
                              ),
                            ),
                            padding: const EdgeInsets.only(bottom: 4, left: 4, right: 8),
                            child: const Text("Cadastrar-se", style: AppTextStyles.title,),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 16,
                        children: [
                          Column(
                            spacing: 8,
                            children: [
                              AppTextInput(
                                label: "Nome",
                                leading: FontAwesomeIcons.signature,
                                controller: nameController,
                              ),
                              AppTextInput(
                                label: "E-mail",
                                leading: FontAwesomeIcons.solidEnvelope,
                                controller: emailController,
                              ),
                              AppTextInput(
                                label: "Senha",
                                secret: secret,
                                leading: FontAwesomeIcons.lock,
                                controller: passwordController,
                              ),
                            ],
                          ),
                          const ExcludeSemantics(child: SizedBox(height: kScreenPadding,)),
                          Row(
                            children: [
                              Expanded(
                                child: ValueListenableBuilder(
                                  valueListenable: form,
                                  builder: (context, value, child) {
                                    return AppButton(
                                      enabled: value,
                                      onClick: (context) {
                                        AppRoutes.home.resetTo(context);
                                      },
                                      child: const Text("Entrar")
                                    );
                                  }
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Já possui uma conta? ", style: TextStyle(
                                color: AppColors.grey,
                                fontWeight: FontWeight.w500
                              ),),
                              GestureDetector(
                                onTap: () {
                                  AppRoutes.pop(context);
                                },
                                child: const Text("Entrar", style: TextStyle(
                                  color: AppColors.blue,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w500
                                ),),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ),
              ],
            ),
          );
        },
      )
    );
  }
}