import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rise_up_task/core/usecase/base_usecase.dart';
import 'package:rise_up_task/core/utils/enum.dart';
import 'package:rise_up_task/users/domain/entities/user.dart';
import 'package:rise_up_task/users/domain/usecases/delete_user.dart';
import 'package:rise_up_task/users/domain/usecases/get_users.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final GetUsersUseCase getUsersUseCase;
  final DeleteUserUseCase deleteUserUseCase;

  UsersBloc(this.getUsersUseCase, this.deleteUserUseCase)
      : super(UsersState()) {
    on<GetUsersEvent>(_getUsers);
    on<DeleteUserEvent>(_deleteUser);
  }

  FutureOr<void> _getUsers(
      GetUsersEvent event, Emitter<UsersState> emit) async {
    emit(UsersLoadingState());
    final result = await getUsersUseCase(const NoParameters());

    result.fold((l) => emit(UsersFailerState(usergMessage: l.errorMessage)),
        (r) => emit(UsersSucessState(usersList: r)));
  }

  FutureOr<void> _deleteUser(
      DeleteUserEvent event, Emitter<UsersState> emit) async {
    final result = await deleteUserUseCase(DeleteUserParameters(event.userId));

    result.fold(
        (l) => emit(DeleteUserFailerState(usergMessage: l.errorMessage)),
        (r) => emit(DeleteUserSucessState()));
  }
}
