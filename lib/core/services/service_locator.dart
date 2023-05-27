import 'package:get_it/get_it.dart';
import 'package:rise_up_task/users/data/datasource/user_remote_data_source.dart';
import 'package:rise_up_task/users/data/repository/user_repository.dart';
import 'package:rise_up_task/users/domain/repository/base_user_repository.dart';
import 'package:rise_up_task/users/domain/usecases/create_user.dart';
import 'package:rise_up_task/users/domain/usecases/delete_user.dart';
import 'package:rise_up_task/users/domain/usecases/edit_user.dart';
import 'package:rise_up_task/users/domain/usecases/get_user_details.dart';
import 'package:rise_up_task/users/domain/usecases/get_users.dart';
import 'package:rise_up_task/users/presentation/controller/create_user_bloc/create_user_bloc.dart';
import 'package:rise_up_task/users/presentation/controller/edit_user_bloc/edit_user_bloc.dart';
import 'package:rise_up_task/users/presentation/controller/user_details_bloc/bloc/user_details_bloc.dart';
import 'package:rise_up_task/users/presentation/controller/users_bloc/users_bloc.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static void initGetIt() {
//Bloc
    getIt.registerFactory(() => UsersBloc(getIt(),getIt()));
    getIt.registerFactory(() => CreateUserBloc(getIt()));
    getIt.registerFactory(() => UserDetailsBloc(getIt()));
    getIt.registerFactory(() => EditUserBloc(getIt(),getIt(),getIt()));




//Use Case
    getIt.registerLazySingleton(() => GetUsersUseCase(getIt()));
    getIt.registerLazySingleton(() => CreateUserUseCase(getIt()));
    getIt.registerLazySingleton(() => GetUserDetailsUseCase(getIt()));
    getIt.registerLazySingleton(() => DeleteUserUseCase(getIt()));
    getIt.registerLazySingleton(() => EditUserUseCase(getIt()));

//Repository
    getIt.registerLazySingleton<BaseUserRepository>(
        () => UserRepository(getIt()));

//DaraSource
    getIt.registerLazySingleton<BaseUserRemoteDataSource>(
        () => UserRemoteDataSource());
  }
}
