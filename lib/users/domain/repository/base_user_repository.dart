import 'package:dartz/dartz.dart';
import 'package:rise_up_task/core/errors/failure.dart';
import 'package:rise_up_task/users/domain/entities/user.dart';
import 'package:rise_up_task/users/domain/usecases/create_user.dart';
import 'package:rise_up_task/users/domain/usecases/delete_user.dart';
import 'package:rise_up_task/users/domain/usecases/get_user_details.dart';

abstract class BaseUserRepository {

  Future<Either<Failure, List<User>>> getUsers();
  Future<Either<Failure, User>> creatUser(CreateUserParameters parameters);
  Future<Either<Failure, User>> getUserDetails(UserDetailsParameters parameters);
  Future<Either<Failure, void>> deleteUser(DeleteUserParameters parameters);

}
