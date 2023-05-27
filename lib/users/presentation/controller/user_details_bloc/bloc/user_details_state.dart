part of 'user_details_bloc.dart';

 class UserDetailsState  {
  final User? user;
  final RequestState userDetailsState;
  final String userDetailsMessage;

  const UserDetailsState(
      {
      this.user,
      this.userDetailsState = RequestState.loading,
      this.userDetailsMessage = ''});



  UserDetailsState copyWith({
  final User? user,
  final RequestState? userDetailsState,
  final String? userDetailsMessage
  }){
    return UserDetailsState(
      user: user ?? this.user,
      userDetailsState: userDetailsState?? this.userDetailsState,
      userDetailsMessage: userDetailsMessage?? this.userDetailsMessage
    );
  }    
  //@override
  //List<Object> get props => [user!, userDetailsState, userDetailsMessage];
}

