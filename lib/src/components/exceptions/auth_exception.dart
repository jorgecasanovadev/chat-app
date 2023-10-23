import 'dart:async';

import 'package:vca_chat/src/modules/utils/toast.dart';

class RegisterWithEmailAndPasswordFailure {
  RegisterWithEmailAndPasswordFailure([
    this.message = 'Un Error inesperado ocurrio',
  ]);

  factory RegisterWithEmailAndPasswordFailure.code({required String code}) {
    switch (code) {
      case 'weak-password':
        ToastMessages.showToast(
          'La contraseña ingresada es debil.',
        );
        return RegisterWithEmailAndPasswordFailure(
          'Por favor ingrese una contraseña más segura.',
        );
      case 'invalid-email':
        ToastMessages.showToast(
          'El correo electrónico ingresado no es valido.',
        );
        return RegisterWithEmailAndPasswordFailure(
          'Correo electrónico invalido.',
        );
      case 'email-already-in-use':
        ToastMessages.showToast(
          'El correo electrónico ingresado esta siendo utilizado.',
        );
        return RegisterWithEmailAndPasswordFailure(
          'Existe una cuenta con el mismo correo eletrónico.',
        );
      case 'operation-not-allowed':
        ToastMessages.showToast(
          'La operación no esta permitida.',
        );
        return RegisterWithEmailAndPasswordFailure(
          'Operación no permitida. Por favor contactese con nosotros.',
        );
      case 'user-disabled':
        unawaited(
          ToastMessages.showToast(
            'Usuario deshabilitado.',
          ),
        );
        return RegisterWithEmailAndPasswordFailure(
          'Usuario deshabilitado. Por favor contactese con nosotros por ayuda.',
        );
      default:
        return RegisterWithEmailAndPasswordFailure();
    }
  }

  final String message;
}
