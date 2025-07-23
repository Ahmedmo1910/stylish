import 'package:flutter/material.dart';
import 'package:stylish/core/widgets/custom_text_form_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.onSaved,
  });
  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      onSaved: (value) {
        if (widget.onSaved != null) {
          widget.onSaved!(value);
        }
      },
      hintText: 'Password',
      obscureText: obscureText,
      prefixIcon: Image.asset(
        'assets/icons/lock.png',
        colorBlendMode: BlendMode.overlay,
        width: 24.0,
        height: 24.0,
      ),
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: obscureText
            ? const Icon(
                Icons.visibility_off,
                color: Colors.grey,
                size: 24.0,
              )
            : Image.asset(
                'assets/icons/eye.png',
                colorBlendMode: BlendMode.overlay,
                width: 24.0,
                height: 24.0,
              ),
      ),
    );
  }
}
