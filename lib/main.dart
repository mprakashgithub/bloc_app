import 'package:bloc_app/logic/cubits/post_cubit/post_cubit.dart';
import 'package:bloc_app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PostCubit()),
        // BlocProvider(create: (_) => PostCubit()),
      ],
      // create: (context) => PostCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

//increment decrement state manage
//Method creation and calling
//Navigation in bloc
//Cubit and bloc
