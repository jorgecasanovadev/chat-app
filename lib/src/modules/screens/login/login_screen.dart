import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vca_chat/src/modules/themes/themes.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Icon(
                Icons.message,
                size: 80,
                color: grey700,
              ),
              Text(
                'VCA Chat \nBienvenido de nuevo',
                textAlign: TextAlign.center,
                style: TypographyStyle.h6.grey100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
