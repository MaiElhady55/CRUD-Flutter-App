import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rise_up_task/core/errors/failure.dart';
import 'package:rise_up_task/core/usecase/base_usecase.dart';
import 'package:rise_up_task/users/domain/entities/user.dart';
import 'package:rise_up_task/users/domain/repository/base_user_repository.dart';

class EditUserUseCase extends BaseUseCase<User, EditUserParameters> {
  final BaseUserRepository baseUserRepository;

  EditUserUseCase(this.baseUserRepository);
  @override
  Future<Either<Failure, User>> call(EditUserParameters parameters) async {
    return await baseUserRepository.editUser(parameters);
  }
}

class EditUserParameters extends Equatable {
  final int userId;
  final String name;
  final String email;
  final String gender;
  final String status;

  const EditUserParameters({
    required this.userId,
    required this.name,
    required this.email,
    required this.gender,
    required this.status,
  });

  @override
  List<Object?> get props => [userId,name, email, gender, status];
}
