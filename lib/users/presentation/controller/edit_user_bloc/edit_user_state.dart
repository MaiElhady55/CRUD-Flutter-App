part of 'edit_user_bloc.dart';

abstract class EditUserState extends Equatable {
  const EditUserState();

  @override
  List<Object> get props => [];
}

class EditUserInitial extends EditUserState {}

class EditUserLoading extends EditUserState {}

class EditUserSuccess extends EditUserState {
  final User editUser;

  const EditUserSuccess({required this.editUser});
  @override
  List<Object> get props => [editUser];
}

class EditUserFailure extends EditUserState {
  final String editUserMessage;
  const EditUserFailure({required this.editUserMessage});
  @override
  List<Object> get props => [editUserMessage];
}
