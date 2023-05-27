part of 'users_bloc.dart';

 class UsersState extends Equatable {
  final List<User> users;
  final RequestState usersState;
  final String usersMessage;
  final RequestState deleteUserState;
  final String deleteUserMessage;

  const UsersState(
      {this.users = const [],
      this.usersState = RequestState.loading,
      this.usersMessage = '',
      this.deleteUserState=RequestState.loading,
      this.deleteUserMessage=''
      });



  UsersState copyWith({
  final List<User>? users,
  final RequestState? usersState,
  final String? usersMessage,
  final RequestState? deleteUserState,
  final String? deleteUserMessage
  }){
    return UsersState(
      users: users ?? this.users,
      usersState: usersState?? this.usersState,
      usersMessage: usersMessage?? this.usersMessage,
      deleteUserState: deleteUserState??this.deleteUserState,
      deleteUserMessage: deleteUserMessage??this.deleteUserMessage
    );
  }    
  @override
  List<Object> get props => [users, usersState, usersMessage];
}

