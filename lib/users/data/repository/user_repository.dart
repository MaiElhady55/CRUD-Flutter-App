import 'package:dio/dio.dart';
import 'package:rise_up_task/users/data/datasource/user_remote_data_source.dart';
import 'package:rise_up_task/users/domain/entities/user.dart';
import 'package:rise_up_task/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:rise_up_task/users/domain/repository/base_user_repository.dart';
import 'package:rise_up_task/users/domain/usecases/create_user.dart';
import 'package:rise_up_task/users/domain/usecases/delete_user.dart';
import 'package:rise_up_task/users/domain/usecases/edit_user.dart';
import 'package:rise_up_task/users/domain/usecases/get_user_details.dart';

class UserRepository extends BaseUserRepository {
  final BaseUserRemoteDataSource baseUserRemoteDataSource;

  UserRepository(this.baseUserRemoteDataSource);
  @override
  Future<Either<Failure, List<User>>> getUsers() async {
    var result = await baseUserRemoteDataSource.getUsers();
    try {
      return right(result);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> creatUser(
      CreateUserParameters parameters) async {
    final result = await baseUserRemoteDataSource.creatUser(parameters);
    try {
      return right(result);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> getUserDetails(
      UserDetailsParameters parameters) async {
    final result = await baseUserRemoteDataSource.getUserDetails(parameters);

    try {
      return right(result);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteUser(
      DeleteUserParameters parameters) async {
    final result = await baseUserRemoteDataSource.deleteUser(parameters);
    try {
      return right(result);
    }  catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
    
    /*on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.message));
    }*/
  }

  @override
  Future<Either<Failure, User>> editUser(EditUserParameters parameters) async{
    final result = await baseUserRemoteDataSource.editUser(parameters);
    try {
      return right(result);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
