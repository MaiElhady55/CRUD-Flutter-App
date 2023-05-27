import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rise_up_task/core/errors/failure.dart';
import 'package:rise_up_task/core/usecase/base_usecase.dart';
import 'package:rise_up_task/users/domain/entities/user.dart';
import 'package:rise_up_task/users/domain/repository/base_user_repository.dart';

class GetUserDetailsUseCase extends BaseUseCase<User, UserDetailsParameters> {
  final BaseUserRepository baseUserRepository;

  GetUserDetailsUseCase(this.baseUserRepository);
  @override
  Future<Either<Failure, User>> call(UserDetailsParameters parameters) async {
    return await baseUserRepository.getUserDetails(parameters);
  }
}

class UserDetailsParameters extends Equatable {
  final int userId;

  const UserDetailsParameters(this.userId);

  @override
  List<Object?> get props => [userId];
}
