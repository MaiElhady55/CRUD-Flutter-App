part of 'user_details_bloc.dart';

abstract class UserDetailsEvent extends Equatable {
  const UserDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetUserDetailsEvent extends UserDetailsEvent {
  final int userId;

  const GetUserDetailsEvent({required this.userId});

  @override
  List<Object> get props => [userId];

}
