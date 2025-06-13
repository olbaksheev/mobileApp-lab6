import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/nasa_cubit.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mars Rover App',
      home: BlocProvider(
        create: (_) => NasaCubit()..loadData(),
        child: const HomeScreen(),
      ),
    );
  }
}
