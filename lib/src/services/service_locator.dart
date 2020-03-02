import 'package:get_it/get_it.dart';
import 'package:starter_app/src/repositories/authentication_repository.dart';
import 'package:starter_app/src/repositories/users_repository.dart';
import 'package:starter_app/src/services/local_storage.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  final LocalStorageService localStorageService = await LocalStorageService.getInstance();
  locator.registerSingleton<LocalStorageServiceInterface>(localStorageService);
  final UsersRepository usersRepository = UsersRepository();
  locator.registerSingleton<UsersRepositoryInterface>(usersRepository);

  final AuthenticationRepository authRepository = AuthenticationRepository(
    usersRepository: usersRepository,
  );
  locator.registerSingleton<AuthenticationRepositoryInterface>(authRepository);
}
