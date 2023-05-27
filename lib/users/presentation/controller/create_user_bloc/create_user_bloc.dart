import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rise_up_task/core/utils/enum.dart';
import 'package:rise_up_task/users/domain/entities/user.dart';
import 'package:rise_up_task/users/domain/usecases/create_user.dart';

part 'create_user_event.dart';
part 'create_user_state.dart';

class CreateUserBloc extends Bloc<CreateUserEvent, CreateUserState> {
  final CreateUserUseCase createUserUseCase;
  CreateUserBloc(this.createUserUseCase) : super(const CreateUserState()) {
    on<CreateNewUserEvent>(_createUser);
  }

  FutureOr<void> _createUser(
      CreateNewUserEvent event, Emitter<CreateUserState> emit) async {
    final result = await createUserUseCase(CreateUserParameters(
        name: event.name,
        email: event.email,
        gender: event.gender,
        status: event.status));
    result.fold(
        (l) => emit(state.copyWith(
            createUserMessage: l.errorMessage,
            createUserState: RequestState.error)),
        (r) => emit(
            state.copyWith(user: r, createUserState: RequestState.loaded)));
  }
}
