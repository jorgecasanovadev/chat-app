import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vca_chat/src/components/helpers/helpers.dart';
import 'package:vca_chat/src/components/services/chat/chat_service.dart';
import 'package:vca_chat/src/modules/themes/colors.dart';
import 'package:vca_chat/src/modules/themes/theme.dart';
import 'package:vca_chat/src/modules/utils/input_formatter.dart';
import 'package:vca_chat/src/modules/widgets/customs/custom_textfield.dart';

@RoutePage()
class ChatScreen extends StatefulWidget {
  const ChatScreen({
    required this.receiverUserEmail,
    required this.receiverUserID,
    super.key,
  });

  final String receiverUserEmail;
  final String receiverUserID;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _messageController = TextEditingController();
  final _chatService = ChatService();
  final _firebaseAuth = FirebaseAuth.instance;

  Future<void> sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
        receiverId: widget.receiverUserID,
        message: _messageController.text,
      );
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey70,
      appBar: AppBar(
        title: Text(
          extractEmailUsername(widget.receiverUserEmail).capitalize(),
          style: TypographyStyle.h6,
        ),
      ),
      body: Column(
        children: [
          Expanded(child: _buildMessageList()),
          _buildMessageInput(),
        ],
      ),
    );
  }

  // Message List
  Widget _buildMessageList() {
    return StreamBuilder(
      stream: _chatService.getMessages(
        userId: widget.receiverUserID,
        otherUserId: _firebaseAuth.currentUser!.uid,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error ',
              style: TypographyStyle.st4,
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Cargando...', style: TypographyStyle.st4),
                const CircularProgressIndicator(),
              ],
            ),
          );
        }
        return ListView(
          children: snapshot.data!.docs.map<Widget>(_buildMessageItem).toList(),
        );
      },
    );
  }

  // Message Item
  Widget _buildMessageItem(DocumentSnapshot document) {
    final data = document.data()! as Map<String, dynamic>;

    final aligment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Align(
      alignment: aligment,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: aligment,
            margin: const EdgeInsets.only(
              left: 8,
              right: 8,
              top: 8,
              bottom: 2,
            ),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: aligment == Alignment.centerRight
                  ? const Color(0xFFDCF8C6)
                  : white,
              borderRadius: aligment == Alignment.centerRight
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    )
                  : const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              data['message'],
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  // Message input
  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
              fillColor: white,
              hintText: 'Ingresa tu mensaje',
              controller: _messageController,
            ),
          ),
          IconButton(
            onPressed: sendMessage,
            icon: Icon(
              Icons.arrow_circle_right,
              size: 40,
              color: green700,
            ),
          ),
        ],
      ),
    );
  }
}
