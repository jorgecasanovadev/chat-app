import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vca_chat/src/components/data/bloc/internet_connection/internet_connection_bloc.dart';
import 'package:vca_chat/src/components/data/bloc/session/session_bloc.dart';
import 'package:vca_chat/src/components/data/models/session/session_model.dart';
import 'package:vca_chat/src/components/services/firebase/firebase_auth_service.dart';
import 'package:vca_chat/src/modules/screens/auth/helpers/auth_shared_preferences.dart';
import 'package:vca_chat/src/modules/utils/toast.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.sessionBloc,
    required this.internetConnectionBloc,
  }) : super(const AuthState()) {
    on<AuthEvent>((event, emit) {
      emit(
        state.copyWith(
          isLoading: event.isLoading,
          isAuthorized: event.isAuthorized,
          displayUIState: event.displayUIState,
        ),
      );
    });

    on<OnInitAuthEvent>((event, emit) {
      emit(const AuthState());
    });

    on<OnForceLogoutEvent>(
      (event, emit) {
        emit(
          state.copyWith(
            isLoading: false,
            isAuthorized: false,
            displayUIState: AuthUIState.login,
          ),
        );
      },
    );
  }
  final SessionBloc sessionBloc;
  final InternetConnectionBloc internetConnectionBloc;
  final _authService = FirebaseAuthService();

  Future<String> _generateSession({required String username}) async {
    await AuthSharedPreferences.cleanAgentUsername();
    await AuthSharedPreferences.setAgentUserName(username: username);

    final user = FirebaseAuth.instance.currentUser;
    final currentSession = await sessionBloc.getSession();

    final refreshToken = user!.refreshToken;
    unawaited(AuthSharedPreferences.cleanToken());
    unawaited(AuthSharedPreferences.setToken(accessToken: refreshToken!));

    if (currentSession == null) {
      await sessionBloc.insertSession(
        SessionModel(
          username: username,
          name: user.email!,
        ),
      );
      add(const AuthEvent(isLoading: false, isAuthorized: true));
      return 'newSession';
    } else {
      if (currentSession.name != user.email) {
        await sessionBloc.deleteSession();
        await sessionBloc.insertSession(
          SessionModel(
            username: username,
            name: user.email!,
          ),
        );
        add(const AuthEvent(isLoading: false, isAuthorized: true));
        return 'changeUser';
      } else {
        sessionBloc.add(OnLoadSessionEvent(session: currentSession));
        add(const AuthEvent(isLoading: false, isAuthorized: true));
        return 'restoreSession';
      }
    }
  }

  Future<Map<String, String>?> onLogin({
    required String email,
    required String password,
  }) async {
    if (!internetConnectionBloc.state.isActive) {
      unawaited(
        ToastMessages.showToast(
          'authentication.toast.noInternet'.tr(),
        ),
      );
      return null;
    }
    add(const AuthEvent(isLoading: true));
    final result = await _authService.signInWithEmailandPassword(
      email: email,
      password: password,
    );

    if (result.user!.email != null) {
      final result = await _generateSession(username: email);
      return {
        'route': '/home',
        'isNewUser': result,
      };
    }

    if (result.credential!.accessToken == null) {
      unawaited(
        ToastMessages.showToast(
          'authentication.toast.userOrPasswordIncorrect'.tr(),
        ),
      );
      add(const AuthEvent(isLoading: false));
      return null;
    }

    if (result == 'CONFIRM_SIGN_IN_WITH_NEW_PASSWORD') {
      add(
        const AuthEvent(
          isLoading: false,
          displayUIState: AuthUIState.register,
        ),
      );
    }
    return null;
  }
}
