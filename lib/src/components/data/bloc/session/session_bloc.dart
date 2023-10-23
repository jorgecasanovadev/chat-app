import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_logs/flutter_logs.dart';
import 'package:vca_chat/src/components/data/bloc/internet_connection/internet_connection_bloc.dart';
import 'package:vca_chat/src/components/data/models/session/session_model.dart';
import 'package:vca_chat/src/components/data/repositories/session/session_local_repository.dart';
import 'package:vca_chat/src/components/exceptions/failure_error_handler.dart';
import 'package:vca_chat/src/modules/utils/toast.dart';

part 'session_event.dart';
part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  SessionBloc({required this.internetConnectionBloc})
      : super(const SessionState()) {
    on<SessionEvent>((event, emit) {});
    on<OnLoadSessionEvent>((event, emit) {
      emit(
        state.copyWith(
          session: event.session,
        ),
      );
    });
    on<OnClearSessionEvent>((event, emit) {
      emit(
        state.copyWith(),
      );
    });
  }
  final SessionLocalRepository _sessionLocal = SessionLocalRepository();
  final InternetConnectionBloc internetConnectionBloc;

  Future<void> insertSession(SessionModel session) async {
    await _sessionLocal.insertSession(session);
    add(OnLoadSessionEvent(session: session));
  }

  Future<String> getInitScreenName() async {
    if (internetConnectionBloc.state.isActive) {
      final token = FirebaseAuth.instance.currentUser?.getIdToken();

      if (token != null) {
        try {
          final currentUser = await _sessionLocal.getSession();
          add(OnLoadSessionEvent(session: currentUser!));
          return '/home';
        } on Failure catch (e) {
          unawaited(
            FlutterLogs.logThis(
              tag: 'session_local',
              subTag: 'failure_errors',
              logMessage: e.toString(),
            ),
          );
        } catch (e) {
          unawaited(
            FlutterLogs.logThis(
              tag: 'session_local',
              subTag: 'general_errors',
              logMessage: e.toString(),
              level: LogLevel.ERROR,
            ),
          );
          unawaited(
            ToastMessages.showToast(
              'session.toast.errorLoadingSession'.tr(),
            ),
          );
        }
      } else {
        return '/login';
      }
    }

    final currentUser = await _sessionLocal.getSession();

    if (currentUser != null) {
      add(OnLoadSessionEvent(session: currentUser));
      return '/home';
    } else {
      return '/login';
    }
  }

  Future<void> deleteSession() async {
    try {
      await _sessionLocal.deleteSession();
      add(const OnClearSessionEvent());
    } catch (e) {
      unawaited(
        FlutterLogs.logThis(
          tag: 'session_local',
          subTag: 'delete_session_error',
          logMessage: e.toString(),
          level: LogLevel.ERROR,
        ),
      );
    }
  }

  Future<SessionModel?> getSession() async {
    final result = await _sessionLocal.getSession();

    return result;
  }
}
