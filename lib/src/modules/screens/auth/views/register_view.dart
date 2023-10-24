import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vca_chat/src/components/data/bloc/auth/auth_bloc.dart';
import 'package:vca_chat/src/modules/themes/themes.dart';
import 'package:vca_chat/src/modules/widgets/buttons/button.dart';
import 'package:vca_chat/src/modules/widgets/customs/custom_textfield.dart';

@RoutePage()
class RegisterView extends StatefulWidget {
  const RegisterView({
    required this.onPressed,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.isShowPassword,
    super.key,
    this.onTap,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool isShowPassword;
  final void Function()? onTap;
  final void Function() onPressed;

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
        const Icon(
          Icons.message,
          size: 80,
          color: grey100,
        ),
        const SizedBox(height: 20),
        Text(
          'screen.auth.register.initMessage'.tr(),
          textAlign: TextAlign.center,
          style: TypographyStyle.h5.w400.grey100,
        ),
        const SizedBox(height: 30),
        CustomTextField(
          hintText: 'Email',
          fillColor: white,
          controller: widget.emailController,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'screen.auth.register.enterUser'.tr();
            }
            return null;
          },
        ),
        CustomTextField(
          hintText: 'Contraseña',
          fillColor: white,
          controller: widget.passwordController,
          suffixIcon: InkWell(
            onTap: widget.onTap,
            child: widget.isShowPassword
                ? const Icon(Icons.remove_red_eye)
                : const Icon(Icons.visibility_off),
          ),
          obscureText: widget.isShowPassword,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'screen.auth.register.enterPassword'.tr();
            }
            return null;
          },
        ),
        CustomTextField(
          hintText: 'Confirmar contraseña',
          fillColor: white,
          controller: widget.confirmPasswordController,
          suffixIcon: InkWell(
            onTap: widget.onTap,
            child: widget.isShowPassword
                ? const Icon(Icons.remove_red_eye)
                : const Icon(Icons.visibility_off),
          ),
          obscureText: widget.isShowPassword,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'screen.auth.register.confirmPassword'.tr();
            }
            return null;
          },
        ),
        const SizedBox(height: 30),
        SizedBox(
          width: double.infinity,
          child: ButtonWidget(
            onPressed: widget.onPressed,
            label: 'screen.auth.register.register'.tr(),
          ),
        ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '¿Eres miembro?',
              style: TypographyStyle.b1.black54,
            ),
            const SizedBox(width: 5),
            InkWell(
              onTap: () {
                const AuthEvent(
                  isLoading: false,
                  displayUIState: AuthUIState.login,
                );
                setState(() {});
              },
              child: Text(
                'screen.auth.register.initialSection'.tr(),
                style: TypographyStyle.b1.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
