import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rise_up_task/users/domain/entities/user.dart';
import 'package:rise_up_task/users/domain/usecases/edit_user.dart';

part 'edit_user_event.dart';
part 'edit_user_state.dart';

class EditUserBloc extends Bloc<EditUserEvent, EditUserState> {
  final EditUserUseCase editUserUseCase;
  EditUserBloc(this.editUserUseCase) : super(EditUserInitial()) {
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
    result.fold((l) => emit(EditUserFailure(editUserMessage: l.errorMessage)),
        (r) => emit(EditUserSuccess(editUser: r)));
  }
}
