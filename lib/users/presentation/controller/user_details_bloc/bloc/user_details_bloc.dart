import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rise_up_task/core/utils/enum.dart';
import 'package:rise_up_task/users/domain/entities/user.dart';
import 'package:rise_up_task/users/domain/usecases/get_user_details.dart';
import 'package:rise_up_task/users/presentation/controller/users_bloc/users_bloc.dart';

part 'user_details_event.dart';
part 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  final GetUserDetailsUseCase getUserDetailsUseCase;
  UserDetailsBloc(this.getUserDetailsUseCase)
      : super(const UserDetailsState()) {
    on<GetUserDetailsEvent>(_getUserDetails);
  }

  FutureOr<void> _getUserDetails(
      GetUserDetailsEvent event, Emitter<UserDetailsState> emit) async {
    final result =
        await getUserDetailsUseCase(UserDetailsParameters(event.userId));
    result.fold(
        (l) => emit(state.copyWith(
            userDetailsMessage: l.errorMessage,
            userDetailsState: RequestState.error)),
        (r) => emit(
            state.copyWith(user: r, userDetailsState: RequestState.loaded)));
  }
}
