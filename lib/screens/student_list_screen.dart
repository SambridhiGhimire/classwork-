import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/student_list/student_list_bloc.dart';
import '../blocs/student_list/student_list_event.dart';

class StudentListScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student List')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Enter Student Name'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Enter Student Age'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Enter Student Address'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final name = _nameController.text.trim();
                    final age = int.tryParse(_ageController.text.trim());
                    final address = _addressController.text.trim();

                    if (name.isNotEmpty && age != null && address.isNotEmpty) {
                      context.read<StudentListBloc>().add(AddStudentEvent(
                        name: name,
                        age: age,
                        address: address,
                      ));
                      _nameController.clear();
                      _ageController.clear();
                      _addressController.clear();
                    }
                  },
                  child: Text('Add'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final name = _nameController.text.trim();

                    if (name.isNotEmpty) {
                      context.read<StudentListBloc>().add(RemoveStudentEvent(name));
                      _nameController.clear();
                    }
                  },
                  child: Text('Remove'),
                ),
              ],
            ),
            SizedBox(height: 20),
            BlocBuilder<StudentListBloc, List<Student>>(
              builder: (context, studentList) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: studentList.length,
                    itemBuilder: (context, index) {
                      final student = studentList[index];
                      return ListTile(
                        title: Text(student.name),
                        subtitle: Text('Age: ${student.age}, Address: ${student.address}'),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
