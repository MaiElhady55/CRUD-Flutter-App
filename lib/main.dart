import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rise_up_task/core/network/dio_helper.dart';
import 'package:rise_up_task/core/services/service_locator.dart';
import 'package:rise_up_task/users/presentation/controller/user_details_bloc/bloc/user_details_bloc.dart';
import 'package:rise_up_task/users/presentation/screens/users_screen.dart';

import 'users/presentation/controller/create_user_bloc/create_user_bloc.dart';

void main() {
  
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  ServiceLocator.initGetIt();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<CreateUserBloc>(),
)
      ],
      child: MaterialApp(
          title: 'Rise Up Task',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const UsersScreen()),
    );
  }
}
