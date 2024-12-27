import 'package:flutter_bloc/flutter_bloc.dart';

class ArithmeticCubit extends Cubit<int> {
  ArithmeticCubit() : super(0);
  void add(int num1, int num2) {
    emit(num1 + num2);
  }

  void sub(int num1, int num2) {
    emit(num1 - num2);
  }

  void multiply(int num1, int num2) {
    emit(num1 * num2);
  }
}
