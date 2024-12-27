import 'package:class_assignment_two/cubit/arthimetic_cubit.dart';
import 'package:class_assignment_two/cubit/circlearea_cubit';
import 'package:class_assignment_two/cubit/simpleintereset_cubit.dart';
import 'package:class_assignment_two/cubit/temperature_cubit.dart';
import 'package:class_assignment_two/view/arthimetic_cubit_view.dart';
import 'package:class_assignment_two/view/circlearea_cubit_view.dart';
import 'package:class_assignment_two/view/simpleintereset_cubit_view.dart';
import 'package:class_assignment_two/view/temperature_cubit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<void> {
  DashboardCubit(
    this._simpleInterestCubit,
    this._arithmeticCubit,
    this._circleAreaCubit,
    this._temperatureCubit,
  ) : super(null);
  final SimpleInterestCubit _simpleInterestCubit;
  final ArithmeticCubit _arithmeticCubit;
  final CircleAreaCubit _circleAreaCubit;
  final TemperatureCubit _temperatureCubit;

  void openCircleareaView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _circleAreaCubit,
          child: CircleareaCubitView(),
        ),
      ),
    );
  }

  void openArthimeticView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _arithmeticCubit,
          child: ArithmeticCubitView(),
        ),
      ),
    );
  }

  void openSimpleinterestView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _simpleInterestCubit,
          child: SimpleInterestCubitView(),
        ),
      ),
    );
  }

  void openTempertaureView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _temperatureCubit,
          child: TemperatureCubitView(),
        ),
      ),
    );
  }
}
