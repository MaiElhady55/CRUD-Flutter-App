import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rise_up_task/users/domain/entities/user.dart';
import 'package:rise_up_task/users/domain/usecases/edit_user.dart';
import 'package:rise_up_task/users/presentation/controller/user_details_bloc/bloc/user_details_bloc.dart';
import 'package:rise_up_task/users/presentation/controller/users_bloc/users_bloc.dart';

part 'edit_user_event.dart';
part 'edit_user_state.dart';

class EditUserBloc extends Bloc<EditUserEvent, EditUserState> {
  final EditUserUseCase editUserUseCase;
  final UserDetailsBloc userDetailsBloc;
  final UsersBloc usersBloc;
  EditUserBloc(this.editUserUseCase, this.userDetailsBloc, this.usersBloc)
      : super(EditUserInitial()) {
    on<EditNewUserEvent>(_editUser);
  }

  FutureOr<void> _editUser(
      EditNewUserEvent event, Emitter<EditUserState> emit) async {
    emit(EditUserLoading());
    final result = await editUserUseCase(EditUserParameters(
        userId: event.userId,
        name: event.name,
        email: event.email,
        gender: event.gender,
        status: event.status));
    userDetailsBloc.add(GetUserDetailsEvent(userId: event.userId));
    result.fold((l) => emit(EditUserFailure(editUserMessage: l.errorMessage)),
        (r) => emit(EditUserSuccess(editUser: r)));
    usersBloc.add(GetUsersEvent());
  }
}
