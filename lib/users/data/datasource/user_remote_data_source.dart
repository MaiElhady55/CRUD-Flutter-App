import 'package:dio/dio.dart';
import 'package:rise_up_task/core/errors/exceptions.dart';
import 'package:rise_up_task/core/network/api_constance.dart';
import 'package:rise_up_task/core/network/dio_helper.dart';
import 'package:rise_up_task/core/network/error_message_model.dart';
import 'package:rise_up_task/users/data/models/user_model.dart';
import 'package:rise_up_task/users/domain/usecases/create_user.dart';
import 'package:rise_up_task/users/domain/usecases/delete_user.dart';
import 'package:rise_up_task/users/domain/usecases/edit_user.dart';
import 'package:rise_up_task/users/domain/usecases/get_user_details.dart';

abstract class BaseUserRemoteDataSource {
  Future<List<UserModel>> getUsers();
  Future<UserModel> creatUser(CreateUserParameters parameters);
  Future<UserModel> getUserDetails(UserDetailsParameters parameters);
  Future<void> deleteUser(DeleteUserParameters parameters);
  Future<UserModel> editUser(EditUserParameters parameters);

}

class UserRemoteDataSource extends BaseUserRemoteDataSource {
  @override
  Future<List<UserModel>> getUsers() async {
    Response response =
        await DioHelper.getData(endPoint: ApiConstance.endPointUser);

    if (response.statusCode == 200) {
      List<UserModel> usersList = [];

      for (var i in response.data) {
        usersList.add(UserModel.fromJson(i));
      }
      return usersList;
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<UserModel> creatUser(CreateUserParameters parameters) async {
    Response response =
        await DioHelper.postData(endPoint: ApiConstance.endPointUser, data: {
      'name': parameters.name,
      'email': parameters.email,
      'gender': parameters.gender,
      'status': parameters.status
    });
    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<UserModel> getUserDetails(UserDetailsParameters parameters) async {
    Response response = await DioHelper.getData(
        endPoint: '${ApiConstance.endPointUser}/${parameters.userId}');

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<void> deleteUser(DeleteUserParameters parameters) async {
 await DioHelper.deleteData(
        endPoint: '${ApiConstance.endPointUser}/${parameters.userId}');
    
  }
  
  @override
  Future<UserModel> editUser(EditUserParameters parameters) async{
    Response response = await DioHelper.postData(endPoint: ApiConstance.editPath(parameters.userId), data: {
      'name': parameters.name,
      'email': parameters.email,
      'gender': parameters.gender,
      'status': parameters.status
    });
    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
