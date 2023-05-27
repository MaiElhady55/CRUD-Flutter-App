part of 'edit_user_bloc.dart';

abstract class EditUserEvent extends Equatable {
  const EditUserEvent();

  @override
  List<Object> get props => [];



}
class EditNewUserEvent extends EditUserEvent {
  final int userId;
  final String name;
  final String email;
  final String gender;
  final String status;

  const EditNewUserEvent({required this.name, required this.email, required this.gender, required this.status,required this.userId});
    List<Object> get props => [
      name,
      email,
      gender,
      status,
      userId
    ];
    }
