import 'package:dartz/dartz.dart';
import 'package:rise_up_task/core/errors/failure.dart';
import 'package:rise_up_task/core/usecase/base_usecase.dart';
import 'package:rise_up_task/users/domain/entities/user.dart';
import 'package:rise_up_task/users/domain/repository/base_user_repository.dart';

class GetUsersUseCase extends BaseUseCase<List<User>,NoParameters> {
  final BaseUserRepository baseUserRepository;

  GetUsersUseCase(this.baseUserRepository);
  
  @override
  Future<Either<Failure, List<User>>> call(NoParameters parameters)async {
    return await baseUserRepository.getUsers();
  }
}
