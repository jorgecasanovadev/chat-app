import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vca_chat/src/modules/screens/auth/auth_screen.dart';
import 'package:vca_chat/src/modules/screens/home/home_screen.dart';

@RoutePage()
class FirebaseAuthGateScreen extends StatelessWidget {
  const FirebaseAuthGateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // Check if the user is logged in
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return const HomeScreen();
            } else {
              return const AuthScreen();
            }
          } else {
            // You can show a loading indicator here if needed
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
