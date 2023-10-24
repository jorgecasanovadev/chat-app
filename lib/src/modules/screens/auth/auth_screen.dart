import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vca_chat/src/modules/screens/auth/views/login_view.dart';
import 'package:vca_chat/src/modules/screens/auth/views/register_view.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool showLoginView = true;

  void togglePages() {
    setState(() {
      showLoginView = !showLoginView;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginView) {
      return LoginView(onTap: togglePages);
    } else {
      return RegisterView(onTap: togglePages);
    }
  }
}
