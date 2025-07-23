import 'package:get_it/get_it.dart';
import 'package:stylish/core/services/fire_base_auth_service.dart';
import 'package:stylish/features/authentication/data/repos/auth_repo_imp.dart';
import 'package:stylish/features/authentication/domain/repos/auth_repo.dart';

final GetIt getIt = GetIt.instance;
void setupGetIt() {
  getIt.registerSingleton<FireBaseAuthService>(FireBaseAuthService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImp(
      fireBaseAuthService: getIt<FireBaseAuthService>(),
    ),
  );
}
