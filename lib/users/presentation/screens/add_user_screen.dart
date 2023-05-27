import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rise_up_task/core/services/service_locator.dart';
import 'package:rise_up_task/users/presentation/components/custom_dropdownbutton.dart';
import 'package:rise_up_task/users/presentation/components/custom_textformfield.dart';
import 'package:rise_up_task/users/presentation/controller/create_user_bloc/create_user_bloc.dart';

class AddUserScreen extends StatelessWidget {
   AddUserScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();
  List<String> gender = ["male", "female", "Other"];

  List<String> status = ["active", "inactive"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
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
                    suffixIcon: CustomDropDownButton(controller: genderController,items: gender,)
                  ),
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
                    suffixIcon: CustomDropDownButton(items: status,controller: statusController,)
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<CreateUserBloc>(context).add(
                            (CreateNewUserEvent(
                                name: nameController.text,
                                email: emailController.text,
                                gender: genderController.text,
                                status: statusController.text)));
                      }
                    },
                    child: const Text('Add User'),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
