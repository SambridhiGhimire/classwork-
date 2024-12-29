import 'package:flutter_bloc/flutter_bloc.dart';
import 'simple_interest_event.dart';

class SimpleInterestBloc extends Bloc<SimpleInterestEvent, double> {
  SimpleInterestBloc() : super(0.0) {
    on<CalculateInterestEvent>((event, emit) {
      final interest = (event.principal * event.rate * event.time) / 100;
      emit(interest);
    });
  }
}
