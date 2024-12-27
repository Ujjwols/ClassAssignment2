import 'package:flutter_bloc/flutter_bloc.dart';

class TemperatureCubit extends Cubit<double> {
  TemperatureCubit() : super(0.0);

  void convertToFahrenheit(double celsius) {
    double fahrenheit = (celsius * 9 / 5) + 32;
    emit(fahrenheit);
  }
}
