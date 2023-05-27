import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rise_up_task/core/functions/navigation.dart';
import 'package:rise_up_task/core/functions/show_toast.dart';
import 'package:rise_up_task/core/services/service_locator.dart';
import 'package:rise_up_task/core/utils/size_config.dart';
import 'package:rise_up_task/users/domain/entities/user.dart';
import 'package:rise_up_task/users/presentation/components/custom_dropdownbutton.dart';
import 'package:rise_up_task/users/presentation/components/custom_textformfield.dart';
import 'package:rise_up_task/users/presentation/components/main_button.dart';
import 'package:rise_up_task/users/presentation/controller/edit_user_bloc/edit_user_bloc.dart';
import 'package:rise_up_task/users/presentation/controller/user_details_bloc/bloc/user_details_bloc.dart';
import 'package:rise_up_task/users/presentation/controller/users_bloc/users_bloc.dart';
import 'package:rise_up_task/users/presentation/screens/users_screen.dart';

class EditUserScreenBody extends StatelessWidget {
  final User? user;
  final int userId;
  final UserDetailsState userDetailsState;

  EditUserScreenBody(
      {super.key,
      required this.user,
      required this.userDetailsState,
      required this.userId});

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController statusController = TextEditingController();

  final TextEditingController genderController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();
  List<String> gender = ["male", "female", "Other"];

  List<String> status = ["active", "inactive"];
  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.height(context);
    nameController.text = user!.name;
    emailController.text = user!.email;
    genderController.text = user!.gender;
    statusController.text = user!.status;

    return BlocProvider(
        create: (context) => getIt<EditUserBloc>(),
        child: BlocConsumer<EditUserBloc, EditUserState>(
          listener: (context, state) {
            if (status is EditUserState) {
              showMySnackBar(
                  context: context,
                  text: 'Edit Successfuly',
                  color: Colors.green);
            } else {
              showMySnackBar(
                  context: context, text: 'Edit Failed', color: Colors.red);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
                child: Form(
                    key: formKey,
                    child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(children: [
                          if (state is EditUserLoading)
                            const LinearProgressIndicator(),
                          SizedBox(
                            height: height * 0.060,
                          ),
                          CustomTextFormField(
                              controller: nameController,
                              hintText: 'Name',
                              type: TextInputType.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Name field cant not be empty';
                                } else if (value.length < 2) {
                                  return 'Invalid Name';
                                } else {
                                  return null;
                                }
                              },
                              textInputAction: TextInputAction.next),
                          const SizedBox(
                            height: 16,
                          ),
                          CustomTextFormField(
                            controller: emailController,
                            hintText: 'Email',
                            type: TextInputType.emailAddress,
                            validator: (value) {
                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value!);
                              if (!emailValid) {
                                return 'Invalid Email Address';
                              } else if (value.isEmpty) {
                                return 'Email field cant not be empty';
                              } else {
                                return null;
                              }
                            },
                            textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          CustomTextFormField(
                              controller: genderController,
                              hintText: 'Gender',
                              type: TextInputType.none,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Gender field cant not be empty';
                                }
                              },
                              textInputAction: TextInputAction.next,
                              suffixIcon: CustomDropDownButton(
                                controller: genderController,
                                items: gender,
                              )),
                          const SizedBox(
                            height: 16,
                          ),
                          CustomTextFormField(
                              controller: statusController,
                              hintText: 'Status',
                              type: TextInputType.none,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Status field cant not be empty';
                                }
                              },
                              textInputAction: TextInputAction.done,
                              suffixIcon: CustomDropDownButton(
                                items: status,
                                controller: statusController,
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          MainButton(
                              text: 'Edit User',
                              fun: () {
                                if (formKey.currentState!.validate()) {
                                  BlocProvider.of<EditUserBloc>(context).add(
                                      (EditNewUserEvent(
                                          userId: userId,
                                          name: nameController.text,
                                          email: emailController.text,
                                          gender: genderController.text,
                                          status: statusController.text)));
                                  BlocProvider.of<UsersBloc>(context)
                                      .add(GetUsersEvent());
                                  navigateTo(
                                      context: context,
                                      router: const UsersScreen());
                                }
                              })
                        ]))));
          },
        ));
  }
}
