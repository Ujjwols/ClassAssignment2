import 'package:class_assignment_two/cubit/arthimetic_cubit.dart';
import 'package:class_assignment_two/cubit/circlearea_cubit';
import 'package:class_assignment_two/cubit/dashboard_cubit.dart';
import 'package:class_assignment_two/cubit/simpleintereset_cubit.dart';
import 'package:class_assignment_two/cubit/temperature_cubit.dart';
import 'package:class_assignment_two/view/dashboard_cubit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SimpleInterestCubit(),
        ),
        BlocProvider(
          create: (context) => ArithmeticCubit(),
        ),
        BlocProvider(
          create: (context) => CircleAreaCubit(),
        ),
        BlocProvider(
          create: (context) => TemperatureCubit(),
        ),
        BlocProvider(
          create: (context) => DashboardCubit(
            context.read<SimpleInterestCubit>(),
            context.read<ArithmeticCubit>(),
            context.read<CircleAreaCubit>(),
            context.read<TemperatureCubit>(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter BLoc',
        home: DashboardCubitView(),
      ),
    );
  }
}
