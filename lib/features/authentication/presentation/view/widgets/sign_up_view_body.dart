import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/utils/app_text_styles.dart';
import 'package:stylish/core/widgets/custom_button.dart';
import 'package:stylish/core/widgets/custom_text.dart';
import 'package:stylish/core/widgets/custom_text_form_field.dart';
import 'package:stylish/core/widgets/have_account_widget.dart';
import 'package:stylish/core/widgets/password_field.dart';
import 'package:stylish/core/widgets/social_login_button.dart';
import 'package:stylish/features/authentication/presentation/cubits/signup_cubit/sign_up_cubit.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password, name;
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
                label: 'Create an ',
                textColor: Colors.black,
              ),
              const CustomText(
                label: 'account',
                textColor: Colors.black,
              ),
              const SizedBox(height: 32.0),
              CustomTextFormField(
                onSaved: (value) => name = value!,
                hintText: 'User Name',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Image.asset(
                  'assets/icons/User.png',
                  colorBlendMode: BlendMode.overlay,
                  width: 24.0,
                  height: 24.0,
                ),
              ),
              const SizedBox(height: 32.0),
              CustomTextFormField(
                onSaved: (value) => email = value!,
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Image.asset(
                  'assets/icons/Mail.png',
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
              Text.rich(
                TextSpan(
                  text: 'By clicking the ',
                  style: AppTextStyles.regular14.copyWith(
                    color: const Color(0xFF676767),
                  ),
                  children: [
                    TextSpan(
                      text: 'Register',
                      style: AppTextStyles.regular14.copyWith(
                        color: const Color(0xFFFF4B26),
                      ),
                    ),
                    const TextSpan(text: ' button,'),
                    TextSpan(
                      text: ' you agree          to the public offer',
                      style: AppTextStyles.regular14.copyWith(
                        color: const Color(0xFF676767),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48.0),
              MainButton(
                text: 'Sign Up',
                hasCircularBorder: true,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context
                        .read<SignUpCubit>()
                        .createUserWithEmailAndPassword(email, password, name);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(height: 48.0),
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
                    onTap: () => context.read<SignUpCubit>().signinWithGoogle(),
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
                        context.read<SignUpCubit>().signinWithFacebook(),
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              const HaveAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
