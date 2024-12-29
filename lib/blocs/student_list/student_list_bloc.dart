import 'package:flutter_bloc/flutter_bloc.dart';
import 'student_list_event.dart';

class Student {
  final String name;
  final int age;
  final String address;

  Student({
    required this.name,
    required this.age,
    required this.address,
  });

  @override
  String toString() => '$name, Age: $age, Address: $address';
}

class StudentListBloc extends Bloc<StudentListEvent, List<Student>> {
  StudentListBloc() : super([]) {
    on<AddStudentEvent>((event, emit) {
      final updatedList = List<Student>.from(state)
        ..add(Student(
          name: event.name,
          age: event.age,
          address: event.address,
        ));
      emit(updatedList);
    });

    on<RemoveStudentEvent>((event, emit) {
      final updatedList =
      List<Student>.from(state)..removeWhere((student) => student.name == event.name);
      emit(updatedList);
    });
  }
}
