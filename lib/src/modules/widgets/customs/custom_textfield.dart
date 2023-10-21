import 'package:flutter/material.dart';
import 'package:vca_chat/src/modules/themes/themes.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.labelTitle,
    this.controller,
    this.keyboardType,
    this.validator,
    this.errorMessage,
    this.enabled = true,
    this.obscureText = false,
    this.onChange,
    this.hintText,
    this.fillColor,
    this.suffixIcon,
  });

  final String? labelTitle;
  final TextEditingController? controller;
  final bool? enabled;
  final String? Function(String?)? validator;
  final void Function(String value)? onChange;
  final String? errorMessage;
  final String? hintText;
  final TextInputType? keyboardType;
  final Color? fillColor;
  final Widget? suffixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelTitle != null)
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    labelTitle!,
                    style: labelTitle == ''
                        ? TypographyStyle.normal.bold.red
                        : TypographyStyle.normal.bold.secondColor,
                  ),
                ],
              ),
            ),
          const SizedBox(height: 5),
          TextFormField(
            style: TypographyStyle.st165.black54.w500.s16,
            controller: controller,
            enabled: enabled,
            decoration: InputDecoration(
              fillColor: fillColor,
              filled: fillColor != null ? true : null,
              hintText: hintText,
              hintStyle: TypographyStyle.st165.grey100.w500.s16,
              contentPadding: const EdgeInsets.all(12),
              counterStyle: TypographyStyle.b1,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: fillColor ?? secondColor),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: red),
              ),
              errorStyle: TypographyStyle.overline1.red,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: fillColor ?? secondColor),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: red),
              ),
              errorText: errorMessage == '' ? null : errorMessage,
              suffixIcon: suffixIcon,
            ),
            obscureText: obscureText,
            keyboardType: keyboardType,
            validator: validator,
          ),
        ],
      ),
    );
  }
}
