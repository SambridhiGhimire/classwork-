import 'package:equatable/equatable.dart';

abstract class AreaOfCircleEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CalculateAreaEvent extends AreaOfCircleEvent {
  final double radius;

  CalculateAreaEvent(this.radius);

  @override
  List<Object?> get props => [radius];
}
