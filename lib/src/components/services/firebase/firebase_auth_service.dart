import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:vca_chat/src/components/helpers/helpers.dart';
import 'package:vca_chat/src/modules/utils/toast.dart';

class FirebaseAuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> signInWithEmailandPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          unawaited(
            ToastMessages.showError(
              'El usuario ingresado no existe.',
            ),
          );
        case 'invalid-email':
          unawaited(
            ToastMessages.showError(
              'El correo electrónico ingresado no es valido.',
            ),
          );
        case 'channel-error':
          unawaited(
            ToastMessages.showError(
              'Contraseña incorrecta, imposible establecer conexión.',
            ),
          );
        default:
      }
      Log.p.e('OnLoginFirebaseException(${e.code}: ${e.message}');
      throw Exception(e);
    } catch (e) {
      Log.p.e('OnLoginGeneralException: $e');
      rethrow;
    }
  }
}
