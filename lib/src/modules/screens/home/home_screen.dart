import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vca_chat/src/components/config/app_router.gr.dart';
import 'package:vca_chat/src/components/services/firebase/firebase_auth_service.dart';
import 'package:vca_chat/src/modules/themes/theme.dart';
import 'package:vca_chat/src/modules/utils/input_formatter.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;

  void signOut() {
    Provider.of<FirebaseAuthService>(context, listen: false).signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton(onPressed: signOut, icon: const Icon(Icons.logout)),
        ],
      ),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
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
          children:
              snapshot.data!.docs.map<Widget>(_buildUserListItem).toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(DocumentSnapshot document) {
    final router = AutoRouter.of(context);
    final data = document.data()! as Map<String, dynamic>;

    if (_auth.currentUser!.email != data['email']) {
      return ListTile(
        leading: const Icon(Icons.person),
        title: Text(
          extractEmailUsername(data['email']).capitalize(),
          style: TypographyStyle.h6.black54,
        ),
        onTap: () async => router.push(
          ChatRoute(
            receiverUserEmail: data['email'],
            receiverUserID: data['uid'],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
