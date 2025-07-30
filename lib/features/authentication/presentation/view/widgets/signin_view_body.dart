import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/utils/app_colors.dart';
import 'package:stylish/core/utils/app_text_styles.dart';
import 'package:stylish/core/widgets/custom_button.dart';
import 'package:stylish/core/widgets/custom_text.dart';
import 'package:stylish/core/widgets/custom_text_form_field.dart';
import 'package:stylish/core/widgets/dont_have_account_widget.dart';
import 'package:stylish/core/widgets/password_field.dart';
import 'package:stylish/core/widgets/social_login_button.dart';
import 'package:stylish/features/authentication/presentation/cubits/signin_cubit/sign_in_cubit.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                label: 'Welcome',
                textColor: Colors.black,
              ),
              const CustomText(
                label: 'Back!',
                textColor: Colors.black,
              ),
              const SizedBox(height: 32.0),
              CustomTextFormField(
                onSaved: (value) => email = value!,
                hintText: 'Username or Email',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Image.asset(
                  'assets/icons/User.png',
                  colorBlendMode: BlendMode.overlay,
                  width: 24.0,
                  height: 24.0,
                ),
              ),
              const SizedBox(height: 32.0),
              PasswordField(
                onSaved: (value) => password = value!,
              ),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot Password?',
                  style: AppTextStyles.regular14.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 48.0),
              MainButton(
                text: 'Sign In',
                hasCircularBorder: true,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SigninCubit>().signin(
                          email,
                          password,
                        );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(height: 64.0),
              Align(
                alignment: Alignment.center,
                child: Text(
                  '- OR Continue with -',
                  style: AppTextStyles.regular14.copyWith(
                    color: const Color(0xFF575757),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialLoginButton(
                    iconPath: 'assets/icons/google.png',
                    onTap: () => context.read<SigninCubit>().signinWithGoogle(),
                  ),
                  const SizedBox(width: 10),
                  Platform.isIOS
                      ? SocialLoginButton(
                          iconPath: 'assets/icons/apple.png',
                          onTap: () => print('Apple login tapped'),
                        )
                      : const SizedBox(),
                  const SizedBox(width: 10),
                  SocialLoginButton(
                    iconPath: 'assets/icons/facebook.png',
                    onTap: () =>
                        context.read<SigninCubit>().signinWithFacebook(),
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              const DontHaveAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
