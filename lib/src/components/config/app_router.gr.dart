// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:vca_chat/src/components/services/firebase/firebase_auth_gate.dart'
    as _i3;
import 'package:vca_chat/src/modules/screens/auth/auth_screen.dart' as _i1;
import 'package:vca_chat/src/modules/screens/auth/views/login_view.dart' as _i5;
import 'package:vca_chat/src/modules/screens/auth/views/register_view.dart'
    as _i6;
import 'package:vca_chat/src/modules/screens/home/chat_screen.dart' as _i2;
import 'package:vca_chat/src/modules/screens/home/home_screen.dart' as _i4;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthScreen(),
      );
    },
    ChatRoute.name: (routeData) {
      final args = routeData.argsAs<ChatRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ChatScreen(
          receiverUserEmail: args.receiverUserEmail,
          receiverUserID: args.receiverUserID,
          key: args.key,
        ),
      );
    },
    FirebaseAuthGateRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.FirebaseAuthGateScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
    LoginView.name: (routeData) {
      final args = routeData.argsAs<LoginViewArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.LoginView(
          onTap: args.onTap,
          key: args.key,
        ),
      );
    },
    RegisterView.name: (routeData) {
      final args = routeData.argsAs<RegisterViewArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.RegisterView(
          onTap: args.onTap,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthScreen]
class AuthRoute extends _i7.PageRouteInfo<void> {
  const AuthRoute({List<_i7.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ChatScreen]
class ChatRoute extends _i7.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    required String receiverUserEmail,
    required String receiverUserID,
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          ChatRoute.name,
          args: ChatRouteArgs(
            receiverUserEmail: receiverUserEmail,
            receiverUserID: receiverUserID,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const _i7.PageInfo<ChatRouteArgs> page =
      _i7.PageInfo<ChatRouteArgs>(name);
}

class ChatRouteArgs {
  const ChatRouteArgs({
    required this.receiverUserEmail,
    required this.receiverUserID,
    this.key,
  });

  final String receiverUserEmail;

  final String receiverUserID;

  final _i8.Key? key;

  @override
  String toString() {
    return 'ChatRouteArgs{receiverUserEmail: $receiverUserEmail, receiverUserID: $receiverUserID, key: $key}';
  }
}

/// generated route for
/// [_i3.FirebaseAuthGateScreen]
class FirebaseAuthGateRoute extends _i7.PageRouteInfo<void> {
  const FirebaseAuthGateRoute({List<_i7.PageRouteInfo>? children})
      : super(
          FirebaseAuthGateRoute.name,
          initialChildren: children,
        );

  static const String name = 'FirebaseAuthGateRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginView]
class LoginView extends _i7.PageRouteInfo<LoginViewArgs> {
  LoginView({
    required void Function()? onTap,
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          LoginView.name,
          args: LoginViewArgs(
            onTap: onTap,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginView';

  static const _i7.PageInfo<LoginViewArgs> page =
      _i7.PageInfo<LoginViewArgs>(name);
}

class LoginViewArgs {
  const LoginViewArgs({
    required this.onTap,
    this.key,
  });

  final void Function()? onTap;

  final _i8.Key? key;

  @override
  String toString() {
    return 'LoginViewArgs{onTap: $onTap, key: $key}';
  }
}

/// generated route for
/// [_i6.RegisterView]
class RegisterView extends _i7.PageRouteInfo<RegisterViewArgs> {
  RegisterView({
    required void Function()? onTap,
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          RegisterView.name,
          args: RegisterViewArgs(
            onTap: onTap,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'RegisterView';

  static const _i7.PageInfo<RegisterViewArgs> page =
      _i7.PageInfo<RegisterViewArgs>(name);
}

class RegisterViewArgs {
  const RegisterViewArgs({
    required this.onTap,
    this.key,
  });

  final void Function()? onTap;

  final _i8.Key? key;

  @override
  String toString() {
    return 'RegisterViewArgs{onTap: $onTap, key: $key}';
  }
}
