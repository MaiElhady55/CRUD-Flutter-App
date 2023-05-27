
import 'package:equatable/equatable.dart';





import 'package:dartz/dartz.dart';
import 'package:rise_up_task/core/errors/failure.dart';
import 'package:rise_up_task/core/usecase/base_usecase.dart';
import 'package:rise_up_task/users/domain/repository/base_user_repository.dart';

class DeleteUserUseCase extends BaseUseCase<void, DeleteUserParameters> {
  final BaseUserRepository baseUserRepository;

  DeleteUserUseCase(this.baseUserRepository);
  @override
  Future<Either<Failure, void>> call(DeleteUserParameters parameters) async {
    return await baseUserRepository.deleteUser(parameters);
  }
}

class DeleteUserParameters extends Equatable {
  final int userId;

  const DeleteUserParameters(this.userId);

  @override
  List<Object?> get props => [userId];
}