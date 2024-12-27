import 'package:bloc/bloc.dart';

class SimpleInterestCubit extends Cubit<double> {
  SimpleInterestCubit() : super(0.0);

  void calculate(double principal, double rate, double time) {
    emit((principal * rate * time) / 100);
  }
}
