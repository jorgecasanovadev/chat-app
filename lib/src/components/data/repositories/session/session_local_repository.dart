import 'dart:async';

import 'package:flutter_logs/flutter_logs.dart';
import 'package:vca_chat/src/components/data/database/session_db.dart';
import 'package:vca_chat/src/components/data/models/session/session_model.dart';

class SessionLocalRepository {
  final SessionDB sessionDB = SessionDB();

  Future<SessionModel?> getSession() async {
    try {
      return await sessionDB.getSession();
    } catch (e) {
      unawaited(
        FlutterLogs.logThis(
          tag: 'session_local',
          subTag: 'errors_get_session',
          logMessage: e.toString(),
          level: LogLevel.ERROR,
        ),
      );
      rethrow;
    }
  }

  Future<void> insertSession(SessionModel session) async {
    try {
      return await sessionDB.insertSession(session);
    } catch (e) {
      unawaited(
        FlutterLogs.logThis(
          tag: 'session_local',
          subTag: 'errors_on_create',
          logMessage: e.toString(),
          level: LogLevel.ERROR,
        ),
      );
      rethrow;
    }
  }

  Future<void> deleteSession() async {
    try {
      return await sessionDB.deleteSession();
    } catch (e) {
      unawaited(
        FlutterLogs.logThis(
          tag: 'session_local',
          subTag: 'errors_on_delete',
          logMessage: e.toString(),
          level: LogLevel.ERROR,
        ),
      );
      rethrow;
    }
  }
}
