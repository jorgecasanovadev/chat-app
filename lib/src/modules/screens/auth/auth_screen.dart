import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vca_chat/src/components/data/bloc/auth/auth_bloc.dart';
import 'package:vca_chat/src/components/helpers/helpers.dart';
import 'package:vca_chat/src/modules/screens/auth/views/login_view.dart';
import 'package:vca_chat/src/modules/screens/auth/views/register_view.dart';
import 'package:vca_chat/src/modules/themes/themes.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // Blocs
  late AuthBloc _authenticationBloc;

  // Controllers | Variables
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final bool _isShowPassword = false;

  Future<void> signIn() async {
    Log.p.i(
      'email: ${emailController.text} password: ${passwordController.text}',
    );
    final router = AutoRouter.of(context);
    try {
      final result = await _authenticationBloc.onLogin(
        email: emailController.text,
        password: passwordController.text,
      );
      if (result != null) {
        if (result['isNewUser'] == 'changeUser') {
          Log.p.i('change user');
        }
        await Future.delayed(
          const Duration(seconds: 3),
          () {},
        );
        await router.pushNamed('/home');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: red50,
          content: Text(
            'Error: $e',
            style: TypographyStyle.st165.white,
          ),
        ),
      );
    }
  }

  Future<void> signUp() async {}

  @override
  void initState() {
    _authenticationBloc = BlocProvider.of<AuthBloc>(context);

    super.initState();
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
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey[300],
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (state.displayUIState == AuthUIState.login)
                      LoginView(
                        emailController: emailController,
                        passwordController: passwordController,
                        isShowPassword: _isShowPassword,
                        onPressed: signIn,
                      ),
                    if (state.displayUIState == AuthUIState.register)
                      RegisterView(
                        emailController: emailController,
                        passwordController: passwordController,
                        confirmPasswordController: confirmPasswordController,
                        isShowPassword: _isShowPassword,
                        onPressed: signUp,
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
