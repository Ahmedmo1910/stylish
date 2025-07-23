import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/services/get_it_service.dart';
import 'package:stylish/features/authentication/domain/repos/auth_repo.dart';
import 'package:stylish/features/authentication/presentation/cubits/signup_cubit/sign_up_cubit.dart';
import 'package:stylish/features/authentication/presentation/view/widgets/SignUpViewBodyBlocConsumer.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const String routeName = 'signUp';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(
        getIt<AuthRepo>(),
      ),
      child: const Scaffold(
        body: SafeArea(child: SignUpViewBodyBlocConsumer()),
      ),
    );
  }
}
