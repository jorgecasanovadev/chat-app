import 'package:flutter/material.dart';
import 'package:vca_chat/src/modules/themes/themes.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    required this.onPressed,
    required this.label,
    super.key,
    this.isLoading = false,
    this.height = 50,
    this.fontSize = 18,
    this.backgroundColor = darkGreen100,
  });
  final bool isLoading;
  final String label;
  final VoidCallback onPressed;
  final double? height;
  final double? fontSize;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: isLoading
              ? const CircularProgressIndicator(
                  color: green600,
                )
              : Text(
                  label,
                  style: TextStyle(
                    fontSize: fontSize,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
