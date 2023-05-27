import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rise_up_task/core/services/service_locator.dart';
import 'package:rise_up_task/core/utils/enum.dart';
import 'package:rise_up_task/users/presentation/components/edit_user_screen_body.dart';
import 'package:rise_up_task/users/presentation/controller/user_details_bloc/bloc/user_details_bloc.dart';

class EditUserScreen extends StatelessWidget {
  final int userId;

  const EditUserScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            getIt<UserDetailsBloc>()..add(GetUserDetailsEvent(userId: userId)),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Edit User'),
            centerTitle: true,
          ),
          body: BlocBuilder<UserDetailsBloc, UserDetailsState>(
            builder: (context, state) {
              switch (state.userDetailsState) {
                case RequestState.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case RequestState.loaded:
                  return EditUserScreenBody(
                    user: state.user,
                    userDetailsState: state,
                    userId: userId,
                  );
                case RequestState.error:
                  return Center(
                    child: Text(state.userDetailsMessage),
                  );
              }
            },
          ),
        ));
  }
}
