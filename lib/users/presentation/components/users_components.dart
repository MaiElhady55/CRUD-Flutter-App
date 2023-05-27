import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rise_up_task/core/functions/navigation.dart';
import 'package:rise_up_task/core/utils/enum.dart';
import 'package:rise_up_task/users/presentation/components/custom_icon_button.dart';
import 'package:rise_up_task/users/presentation/components/show_dialog.dart';
import 'package:rise_up_task/users/presentation/controller/users_bloc/users_bloc.dart';
import 'package:rise_up_task/users/presentation/screens/user_details_screen.dart';

class UsersComponents extends StatelessWidget {
  const UsersComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      buildWhen: (previous, current) =>
          previous.usersState != current.usersState,
      builder: (context, state) {
        switch (state.usersState) {
          case RequestState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case RequestState.loaded:
            return ListView.builder(
              itemCount: state.users.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => navigateTo(
                      context: context,
                      router: UserDetailsScreen(userId: state.users[index].id)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                    child: SizedBox(
                      height: 80,
                      child: Card(
                          elevation: 2,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(8),
                            title: Text(state.users[index].name),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomIconButton(
                                    color: Colors.blue,
                                    function: () {},
                                    icon: Icons.edit),
                                CustomIconButton(
                                    color: Colors.red,
                                    function: () {
                                      showDeleteDialog(context, () {
                                        BlocProvider.of<UsersBloc>(context).add(
                                          DeleteUserEvent(userId: state.users[index].id)
                                        );
                                      });
                                    },
                                    icon: Icons.delete)
                              ],
                            ),
                          )),
                    ),
                  ),
                );
              },
            );
          case RequestState.error:
            return Center(
              child: Text(state.usersMessage),
            );
        }
      },
    );
  }
}
