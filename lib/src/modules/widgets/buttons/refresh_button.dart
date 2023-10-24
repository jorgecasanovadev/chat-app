import 'package:flutter/material.dart';
import 'package:vca_chat/src/modules/themes/themes.dart';

class RefreshButton extends StatelessWidget {
  const RefreshButton({
    required this.title,
    required this.onPressed,
    super.key,
  });

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            iconSize: 35,
            icon: const Icon(
              Icons.refresh,
              color: darkGreen100,
            ),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
