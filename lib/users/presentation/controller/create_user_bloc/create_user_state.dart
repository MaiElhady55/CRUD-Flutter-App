part of 'create_user_bloc.dart';

 class CreateUserState extends Equatable {
  final User? user;
  final RequestState createUserState;
  final String createUserMessage;

  const CreateUserState(
      {this.user,
      this.createUserState = RequestState.loading,
      this.createUserMessage = ''});

  CreateUserState copyWith({User? user, RequestState? createUserState, String? createUserMessage}) {
    return CreateUserState(
        user: user ?? this.user,
        createUserState: createUserState ?? this.createUserState,
        createUserMessage: createUserMessage ?? this.createUserMessage);
  }

  @override
  List<Object> get props => [user!, createUserState, createUserMessage];
}
