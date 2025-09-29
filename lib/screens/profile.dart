import 'package:flutter/material.dart';
import 'package:flutter_tools/form_validator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neoview/core/constants/colors.dart';
import 'package:neoview/core/constants/rules.dart';
import 'package:neoview/core/constants/sizes.dart';
import 'package:neoview/core/navigation.dart';
import 'package:neoview/widgets/app_button.dart';
import 'package:neoview/widgets/app_inut.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final InputEdittingController<String> nameController = InputEdittingController("", AppRules.name);
  final InputEdittingController<String> emailController = InputEdittingController("", AppRules.email);
  final InputEdittingController<String> oldPasswordController = InputEdittingController("", AppRules.password);
  final InputEdittingController<String> newPasswordController = InputEdittingController("", AppRules.password);
  final InputEdittingController<String> confirmPasswordController = InputEdittingController("", AppRules.password);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil", style: TextStyle(
          color: AppColors.white
        ),),
        leading: IconButton(
          onPressed: () {
            AppRoutes.pop(context);
          },
          icon: const FaIcon(FontAwesomeIcons.chevronLeft, size: 24, color: AppColors.white,)
        ),
        backgroundColor: AppColors.blue,
      ),
      backgroundColor: AppColors.blue,
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          )
        ),
        width: double.infinity,
        child: SafeArea(
          child: Padding(
            padding: AppPaddings.screen,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16
                      ),
                      child: Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFE1E1E1),
                            ),
                            padding: AppPaddings.medium,
                            child: const SizedBox.square(
                              dimension: 192,
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.solidUser,
                                  size: 128,
                                  color: Color(0xFF3C3C3C),
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              
                            },
                            child: const Text(
                              "Alterar foto",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xFF505050)
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                    AppTextInput(
                      label: "Nome",
                      leading: FontAwesomeIcons.signature,
                    ),
                    AppTextInput(
                      label: "E-mail",
                      leading: FontAwesomeIcons.solidEnvelope,
                    ),
                    AppTextInput(
                      label: "Senha atual",
                      leading: FontAwesomeIcons.lock,
                    ),
                    AppTextInput(
                      label: "Nova senha",
                      leading: FontAwesomeIcons.lock,
                    ),
                    AppTextInput(
                      label: "Confirmar nova senha",
                      leading: FontAwesomeIcons.lock,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            onClick: (context) {
                              
                            },
                            child: const Text("Salvar alterações")
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}