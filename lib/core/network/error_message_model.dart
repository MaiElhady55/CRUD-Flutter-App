import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String? field;
  final String? message;

  const ErrorMessageModel({required this.field, required this.message});
  
  @override
  List<Object?> get props => [
    field,
    message
  ];

  factory ErrorMessageModel.fromJson(Map<String,dynamic> jsonData){
    return ErrorMessageModel(
      field:jsonData['field']??'' ,
      message: jsonData ['message']??'');
  }


}
