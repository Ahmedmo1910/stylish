import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylish/features/authentication/domain/entites/user_entity.dart';
import 'package:stylish/features/authentication/domain/repos/auth_repo.dart';

part 'sign_in_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;
  Future<void> signin(String email, String password) async {
    emit(SigninLoading());
    final result = await authRepo.signInWithEmailAndPassword(email, password);

    result.fold(
      (failure) => emit(
        SigninFailure(message: failure.message),
      ),
      (userEntity) => emit(
        SigninSuccess(userEntity: userEntity),
      ),
    );
  }

  Future<void> signinWithGoogle() async {
    emit(SigninLoading());
    final result = await authRepo.signInWithGoogle();

    result.fold(
      (failure) => emit(
        SigninFailure(message: failure.message),
      ),
      (userEntity) => emit(
        SigninSuccess(userEntity: userEntity),
      ),
    );
  }
  Future<void> signinWithFacebook() async {
    emit(SigninLoading());
    final result = await authRepo.signInWithFacebook();

    result.fold(
      (failure) => emit(
        SigninFailure(message: failure.message),
      ),
      (userEntity) => emit(
        SigninSuccess(userEntity: userEntity),
      ),
    );
  }
}
