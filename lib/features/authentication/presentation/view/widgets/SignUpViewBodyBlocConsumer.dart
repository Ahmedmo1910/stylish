import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/helper_functions/build_error_bar.dart';
import 'package:stylish/core/widgets/custom_progress_hud.dart';
import 'package:stylish/features/authentication/presentation/cubits/signup_cubit/sign_up_cubit.dart';
import 'package:stylish/features/authentication/presentation/view/widgets/sign_up_view_body.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
        } else if (state is SignUpFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SignUpLoading ? true : false,
          child: const SignUpViewBody(),
        );
      },
    );
  }
}
