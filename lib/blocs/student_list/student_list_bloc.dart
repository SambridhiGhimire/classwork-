import 'package:flutter_bloc/flutter_bloc.dart';
import 'student_list_event.dart';

class StudentListBloc extends Bloc<StudentListEvent, List<String>> {
  StudentListBloc() : super([]) {
    on<AddStudentEvent>((event, emit) {
      final updatedList = List<String>.from(state)..add(event.name);
      emit(updatedList);
    });

    on<RemoveStudentEvent>((event, emit) {
      final updatedList = List<String>.from(state)..remove(event.name);
      emit(updatedList);
    });
  }
}
