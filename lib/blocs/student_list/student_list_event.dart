import 'package:equatable/equatable.dart';

abstract class StudentListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddStudentEvent extends StudentListEvent {
  final String name;
  final int age;
  final String address;

  AddStudentEvent({
    required this.name,
    required this.age,
    required this.address,
  });

  @override
  List<Object?> get props => [name, age, address];
}

class RemoveStudentEvent extends StudentListEvent {
  final String name;

  RemoveStudentEvent(this.name);

  @override
  List<Object?> get props => [name];
}
