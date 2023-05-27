import 'package:flutter/material.dart';
import 'package:rise_up_task/core/utils/enum.dart';
import 'package:rise_up_task/core/utils/enum.dart';
import 'package:rise_up_task/core/utils/enum.dart';
import 'package:rise_up_task/core/utils/size_config.dart';
import 'package:rise_up_task/users/domain/entities/user.dart';
import 'package:rise_up_task/users/presentation/components/custom_textformfield.dart';
import 'package:rise_up_task/users/presentation/controller/user_details_bloc/bloc/user_details_bloc.dart';

class EditUserScreenBody extends StatelessWidget {
  final User? user;
  final UserDetailsState userDetailsState;

  EditUserScreenBody(
      {super.key, required this.user, required this.userDetailsState});

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController statusController = TextEditingController();

  final TextEditingController genderController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.height(context);
    nameController.text = user!.name;
    emailController.text = user!.email;
    genderController.text = user!.gender;
    statusController.text = user!.status;

    return SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(children: [
                  if (userDetailsState is RequestState)
                    LinearProgressIndicator(),
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
                  )
                ]))));
  }
}
