import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stylish/core/utils/app_colors.dart';
import 'package:stylish/core/utils/app_text_styles.dart';
import 'package:stylish/features/authentication/presentation/view/sign_up_screen.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text.rich(
        TextSpan(
          text: 'Create An Account ',
          style: AppTextStyles.regular14.copyWith(
            color: const Color(0xFF575757),
          ),
          children: [
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(context, SignUpScreen.routeName);
                },
              text: 'Sign Up',
              style: AppTextStyles.semiBold14.copyWith(
                color: AppColors.primaryColor,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primaryColor,
              ),
              
            ),
          ],
        ),
      ),
    );
  }
}