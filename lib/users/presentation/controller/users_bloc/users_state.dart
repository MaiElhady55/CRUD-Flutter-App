part of 'users_bloc.dart';

 class UsersState extends Equatable {
  @override
  List<Object?> get props => [];
}
class UsersInitialState extends UsersState {}

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



