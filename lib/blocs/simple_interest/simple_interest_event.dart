import 'package:equatable/equatable.dart';

abstract class SimpleInterestEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CalculateInterestEvent extends SimpleInterestEvent {
  final double principal;
  final double rate;
  final double time;

  CalculateInterestEvent(this.principal, this.rate, this.time);

  @override
  List<Object?> get props => [principal, rate, time];
}
