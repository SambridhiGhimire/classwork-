import 'package:equatable/equatable.dart';

abstract class StudentListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddStudentEvent extends StudentListEvent {
  final String name;

  AddStudentEvent(this.name);

  @override
  List<Object?> get props => [name];
}

class RemoveStudentEvent extends StudentListEvent {
  final String name;

  RemoveStudentEvent(this.name);

  @override
  List<Object?> get props => [name];
}
