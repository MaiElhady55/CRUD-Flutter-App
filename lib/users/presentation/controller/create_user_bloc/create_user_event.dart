part of 'create_user_bloc.dart';

abstract class CreateUserEvent extends Equatable {
  const CreateUserEvent();

  @override
  List<Object> get props => [];
}

 class CreateNewUserEvent extends CreateUserEvent {
  final String name;
  final String email;
  final String gender;
  final String status;

  const CreateNewUserEvent({required this.name, required this.email, required this.gender, required this.status});
    List<Object> get props => [
      name,
      email,
      gender,
      status
    ];

}
