import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vca_chat/src/components/services/firebase/firebase_auth_service.dart';
import 'package:vca_chat/src/modules/themes/themes.dart';
import 'package:vca_chat/src/modules/widgets/buttons/button.dart';
import 'package:vca_chat/src/modules/widgets/customs/custom_textfield.dart';

@RoutePage()
class LoginView extends StatefulWidget {
  const LoginView({required this.onTap, super.key});

  final void Function()? onTap;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isShowPassword = false;
  bool _isLoading = false;

  Future<void> signIn() async {
    final authService =
        Provider.of<FirebaseAuthService>(context, listen: false);
    try {
      setState(() => _isLoading = true);
      await authService.signInWithEmailandPassword(
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
                  'screen.auth.login.initMessage'.tr(),
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
                      return 'screen.auth.login.enterUser'.tr();
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  hintText: 'Password',
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
                      return 'screen.auth.login.enterPassword'.tr();
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ButtonWidget(
                    onPressed: signIn,
                    isLoading: _isLoading,
                    label: 'screen.auth.login.enter'.tr(),
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '¿Aún no eres miembro?',
                      style: TypographyStyle.b1.black54,
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: widget.onTap,
                      child: Text(
                        'screen.auth.login.registerSection'.tr(),
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
