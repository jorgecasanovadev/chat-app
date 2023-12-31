import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vca_chat/src/components/helpers/helpers.dart';
import 'package:vca_chat/src/modules/utils/toast.dart';

class FirebaseAuthService extends ChangeNotifier {
  final _firebaseAuth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  Future<UserCredential> signInWithEmailandPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _fireStore.collection('users').doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          'email': email,
        },
        SetOptions(merge: true),
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

  Future<UserCredential> signUpWithEmailandPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _fireStore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      unawaited(
        ToastMessages.showError(
          'Error en los servidores, imposible establecer conexión.',
        ),
      );
      Log.p.e('SignUpFirebaseException: $e');
      throw Exception(e);
    } catch (e) {
      Log.p.e('SignUpGeneralException: $e');
      rethrow;
    }
  }

  Future<void> signOut() async {
    return FirebaseAuth.instance.signOut();
  }
}
