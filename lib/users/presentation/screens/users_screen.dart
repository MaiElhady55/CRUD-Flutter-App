import 'package:flutter/material.dart';
import 'package:rise_up_task/core/functions/navigation.dart';
import 'package:rise_up_task/users/presentation/components/users_components.dart';
import 'package:rise_up_task/users/presentation/screens/add_user_screen.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('Users'),
        centerTitle: true,
      ),
      body: const UsersComponents(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          navigateTo(context: context, router: AddUserScreen());
        },
        label: const Text('Add User'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
