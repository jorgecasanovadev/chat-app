import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vca_chat/src/modules/themes/themes.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: green600,
          ),
          onPressed: () => router.pushNamed('/login'),
          child: Text(
            'Login Screen',
            style: TypographyStyle.st4.white,
          ),
        ),
      ),
    );
  }
}
