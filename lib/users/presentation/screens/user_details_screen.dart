import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rise_up_task/core/services/service_locator.dart';
import 'package:rise_up_task/core/utils/enum.dart';
import 'package:rise_up_task/users/presentation/components/custom_richtext.dart';
import 'package:rise_up_task/users/presentation/controller/user_details_bloc/bloc/user_details_bloc.dart';

class UserDetailsScreen extends StatelessWidget {
  final int userId;

  const UserDetailsScreen({super.key, required this.userId});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            getIt<UserDetailsBloc>()..add(GetUserDetailsEvent(userId: userId)),
        child: Scaffold(
            appBar: AppBar(
              title: const Text('User Details'),
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
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.grey.shade200,
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomRichText(
                                    text1: 'Name : ', text2: state.user!.name),
                                const SizedBox(
                                  height: 16,
                                ),
                                CustomRichText(
                                    text1: 'Email : ',
                                    text2: state.user!.email),
                                const SizedBox(
                                  height: 16,
                                ),
                                CustomRichText(
                                    text1: 'Gender : ',
                                    text2: state.user!.gender),
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomRichText(
                                        text1: 'Status : ',
                                        text2: state.user!.status),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      width: 13,
                                      height: 13,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: state.user!.status == 'active'
                                              ? Colors.green
                                              : Colors.red),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  case RequestState.error:
                    return Center(
                      child: Text(state.userDetailsMessage),
                    );
                }
              },
            )));
  }
}
