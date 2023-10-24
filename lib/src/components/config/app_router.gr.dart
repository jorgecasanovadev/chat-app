// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:vca_chat/src/modules/screens/auth/auth_screen.dart' as _i1;
import 'package:vca_chat/src/modules/screens/auth/views/login_view.dart' as _i3;
import 'package:vca_chat/src/modules/screens/auth/views/register_view.dart'
    as _i4;
import 'package:vca_chat/src/modules/screens/home/home_screen.dart' as _i2;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    LoginView.name: (routeData) {
      final args = routeData.argsAs<LoginViewArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.LoginView(
          emailController: args.emailController,
          passwordController: args.passwordController,
          isShowPassword: args.isShowPassword,
          onPressed: args.onPressed,
          key: args.key,
          onTap: args.onTap,
        ),
      );
    },
    RegisterView.name: (routeData) {
      final args = routeData.argsAs<RegisterViewArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.RegisterView(
          onPressed: args.onPressed,
          emailController: args.emailController,
          passwordController: args.passwordController,
          confirmPasswordController: args.confirmPasswordController,
          isShowPassword: args.isShowPassword,
          key: args.key,
          onTap: args.onTap,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthScreen]
class AuthRoute extends _i5.PageRouteInfo<void> {
  const AuthRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginView]
class LoginView extends _i5.PageRouteInfo<LoginViewArgs> {
  LoginView({
    required _i6.TextEditingController emailController,
    required _i6.TextEditingController passwordController,
    required bool isShowPassword,
    required void Function() onPressed,
    _i6.Key? key,
    void Function()? onTap,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          LoginView.name,
          args: LoginViewArgs(
            emailController: emailController,
            passwordController: passwordController,
            isShowPassword: isShowPassword,
            onPressed: onPressed,
            key: key,
            onTap: onTap,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginView';

  static const _i5.PageInfo<LoginViewArgs> page =
      _i5.PageInfo<LoginViewArgs>(name);
}

class LoginViewArgs {
  const LoginViewArgs({
    required this.emailController,
    required this.passwordController,
    required this.isShowPassword,
    required this.onPressed,
    this.key,
    this.onTap,
  });

  final _i6.TextEditingController emailController;

  final _i6.TextEditingController passwordController;

  final bool isShowPassword;

  final void Function() onPressed;

  final _i6.Key? key;

  final void Function()? onTap;

  @override
  String toString() {
    return 'LoginViewArgs{emailController: $emailController, passwordController: $passwordController, isShowPassword: $isShowPassword, onPressed: $onPressed, key: $key, onTap: $onTap}';
  }
}

/// generated route for
/// [_i4.RegisterView]
class RegisterView extends _i5.PageRouteInfo<RegisterViewArgs> {
  RegisterView({
    required void Function() onPressed,
    required _i6.TextEditingController emailController,
    required _i6.TextEditingController passwordController,
    required _i6.TextEditingController confirmPasswordController,
    required bool isShowPassword,
    _i6.Key? key,
    void Function()? onTap,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          RegisterView.name,
          args: RegisterViewArgs(
            onPressed: onPressed,
            emailController: emailController,
            passwordController: passwordController,
            confirmPasswordController: confirmPasswordController,
            isShowPassword: isShowPassword,
            key: key,
            onTap: onTap,
          ),
          initialChildren: children,
        );

  static const String name = 'RegisterView';

  static const _i5.PageInfo<RegisterViewArgs> page =
      _i5.PageInfo<RegisterViewArgs>(name);
}

class RegisterViewArgs {
  const RegisterViewArgs({
    required this.onPressed,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.isShowPassword,
    this.key,
    this.onTap,
  });

  final void Function() onPressed;

  final _i6.TextEditingController emailController;

  final _i6.TextEditingController passwordController;

  final _i6.TextEditingController confirmPasswordController;

  final bool isShowPassword;

  final _i6.Key? key;

  final void Function()? onTap;

  @override
  String toString() {
    return 'RegisterViewArgs{onPressed: $onPressed, emailController: $emailController, passwordController: $passwordController, confirmPasswordController: $confirmPasswordController, isShowPassword: $isShowPassword, key: $key, onTap: $onTap}';
  }
}
