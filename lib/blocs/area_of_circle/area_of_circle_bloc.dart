import 'package:flutter_bloc/flutter_bloc.dart';
import 'area_of_circle_event.dart';

class AreaOfCircleBloc extends Bloc<AreaOfCircleEvent, double> {
  AreaOfCircleBloc() : super(0.0) {
    on<CalculateAreaEvent>((event, emit) {
      final area = 3.1416 * event.radius * event.radius;
      emit(area);
    });
  }
}
