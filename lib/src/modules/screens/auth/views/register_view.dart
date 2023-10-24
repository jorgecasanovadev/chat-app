import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vca_chat/src/components/services/firebase/firebase_auth_service.dart';
import 'package:vca_chat/src/modules/themes/themes.dart';
import 'package:vca_chat/src/modules/widgets/buttons/button.dart';
import 'package:vca_chat/src/modules/widgets/customs/custom_textfield.dart';

@RoutePage()
class RegisterView extends StatefulWidget {
  const RegisterView({required this.onTap, super.key});

  final void Function()? onTap;

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool _isShowPassword = false;
  bool _isLoading = false;

  Future<void> signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: red50,
            content: Text(
              'Contraseña no coincide',
              style: TypographyStyle.st165.white.w600,
            ),
          ),
        );
      }
      return;
    }

    final authService =
        Provider.of<FirebaseAuthService>(context, listen: false);

    try {
      setState(() => _isLoading = true);
      await authService.signUpWithEmailandPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      setState(() => _isLoading = false);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: red50,
            content: Text(
              'Error: $e',
              style: TypographyStyle.st165.white.w600,
            ),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
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
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
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
                  controller: passwordController,
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        _isShowPassword = !_isShowPassword;
                      });
                    },
                    child: _isShowPassword
                        ? const Icon(Icons.remove_red_eye)
                        : const Icon(Icons.visibility_off),
                  ),
                  obscureText: !_isShowPassword,
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
                  controller: confirmPasswordController,
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        _isShowPassword = !_isShowPassword;
                      });
                    },
                    child: _isShowPassword
                        ? const Icon(Icons.remove_red_eye)
                        : const Icon(Icons.visibility_off),
                  ),
                  obscureText: !_isShowPassword,
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
                    onPressed: signUp,
                    isLoading: _isLoading,
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
                      onTap: widget.onTap,
                      child: Text(
                        'screen.auth.register.initialSection'.tr(),
                        style: TypographyStyle.b1.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
