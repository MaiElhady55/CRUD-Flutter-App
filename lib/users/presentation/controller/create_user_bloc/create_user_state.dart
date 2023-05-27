part of 'create_user_bloc.dart';

 class CreateUserState extends Equatable {
  const CreateUserState();
  @override
  List<Object> get props => [];
}

class CreateUserInitial extends CreateUserState {}

class CreateUserLoading extends CreateUserState {}

class CreateUserSuccess extends CreateUserState {
  final User user;

  const CreateUserSuccess({required this.user});
  @override
  List<Object> get props => [user];
}

class CreateUserFailure extends CreateUserState {
  final String createUserMessage;
  const CreateUserFailure({required this.createUserMessage});
  @override
  List<Object> get props => [createUserMessage];
}

