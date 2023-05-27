import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rise_up_task/core/errors/failure.dart';
import 'package:rise_up_task/core/usecase/base_usecase.dart';
import 'package:rise_up_task/users/domain/entities/user.dart';
import 'package:rise_up_task/users/domain/repository/base_user_repository.dart';

class CreateUserUseCase extends BaseUseCase<User, CreateUserParameters> {
  final BaseUserRepository baseUserRepository;

  CreateUserUseCase(this.baseUserRepository);
  @override
  Future<Either<Failure, User>> call(CreateUserParameters parameters) async {
    return await baseUserRepository.creatUser(parameters);
  }
}

class CreateUserParameters extends Equatable {
  final String name;
  final String email;
  final String gender;
  final String status;

  const CreateUserParameters({
    required this.name,
    required this.email,
    required this.gender,
    required this.status,
  });

  @override
  List<Object?> get props => [name, email, gender, status];
}
