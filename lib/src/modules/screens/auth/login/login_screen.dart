import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vca_chat/src/components/config/app_router.gr.dart';
import 'package:vca_chat/src/modules/themes/themes.dart';
import 'package:vca_chat/src/modules/widgets/buttons/button.dart';
import 'package:vca_chat/src/modules/widgets/customs/custom_textfield.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isShowPassword = false;

  void signIn() {}

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                controller: usernameController,
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
                obscureText: _isShowPassword,
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
                    onTap: () {
                      router.push(const RegisterRoute());
                      Navigator.pop(context);
                    },
                    child: Text(
                      'screen.auth.login.registerSection'.tr(),
                      style: TypographyStyle.b1.w600,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
