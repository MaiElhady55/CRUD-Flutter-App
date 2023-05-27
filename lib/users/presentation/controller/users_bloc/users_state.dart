part of 'users_bloc.dart';

 class UsersState extends Equatable {
  @override
  List<Object?> get props => [];
 /* final List<User> users;
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
  List<Object> get props => [users, usersState, usersMessage];*/
}
class UsersInitialState extends UsersState {
  List<Object?> get props => [];
}

class UsersLoadingState extends UsersState {}

class UsersSucessState extends UsersState {
  final List<User> usersList;

   UsersSucessState({required this.usersList});
    @override
  List<Object?> get props => [usersList];
}
 
class UsersFailerState extends UsersState {
  final String usergMessage;

   UsersFailerState({required this.usergMessage});
     @override
  List<Object?> get props => [usergMessage];
}



class DeleteUserFailerState extends UsersState {
  final String usergMessage;

   DeleteUserFailerState({required this.usergMessage});
     @override
  List<Object?> get props => [usergMessage];
}

class DeleteUserSucessState extends UsersState {

    @override
  List<Object?> get props => [];
}



