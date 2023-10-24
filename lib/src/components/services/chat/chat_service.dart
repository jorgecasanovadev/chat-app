import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:vca_chat/src/components/data/models/user-message/user_message.dart';

class ChatService extends ChangeNotifier {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firebaseStore = FirebaseFirestore.instance;
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;

  // Push notifications
  Future<void> getFirebaseMessagingToken() async {
    await _firebaseMessaging.requestPermission();
    await _firebaseMessaging.getToken().then((value) {
      if (value != null) {
        return value;
      }
    });
  }

  // Send Message
  Future<void> sendMessage({
    required String receiverId,
    required String message,
  }) async {
    final currentUserId = _firebaseAuth.currentUser!.uid;
    final currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final timestamp = Timestamp.now();

    final newMessage = UserMessage(
      senderId: currentUserId,
      senderEmail: currentUserEmail,
      receiverId: receiverId,
      message: message,
      timestamp: timestamp,
    );

    // ChatRoom constructor
    final ids = <String>[currentUserId, receiverId];
    ids.sort();
    final chatRoomId = ids.join('_');

    await _firebaseStore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  // Get messages
  Stream<QuerySnapshot> getMessages({
    required String userId,
    required String otherUserId,
  }) {
    final ids = <String>[userId, otherUserId];
    ids.sort();
    final chatRoomId = ids.join('_');

    return _firebaseStore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
