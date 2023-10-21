import 'package:flutter/material.dart';
import 'package:vca_chat/src/modules/themes/themes.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.labelTitle,
    this.controller,
    this.keyboardType,
    this.validator,
    this.errorMessage,
    this.enabled = true,
    this.onChange,
    this.obscureText,
    this.onShowPassword,
    super.key,
  });

  final String labelTitle;
  final TextEditingController? controller;
  final bool? enabled;
  final String? Function(String?)? validator;
  final void Function(String value)? onChange;
  final String? errorMessage;
  final TextInputType? keyboardType;
  final Function()? onShowPassword;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  labelTitle,
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
              contentPadding: const EdgeInsets.all(12),
              counterStyle: TypographyStyle.b1,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: mainColor),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: red),
              ),
              errorStyle: TypographyStyle.overline1.red,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: secondColor),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: red),
              ),
              errorText: errorMessage == '' ? null : errorMessage,
              suffixIcon: (obscureText != null)
                  ? InkWell(
                      onTap: onShowPassword,
                      child: obscureText! == true
                          ? const Icon(
                              Icons.remove_red_eye,
                              color: secondColor,
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: secondColor,
                            ),
                    )
                  : null,
            ),
            keyboardType: keyboardType,
            validator: validator,
          ),
        ],
      ),
    );
  }
}
