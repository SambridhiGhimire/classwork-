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
      appBar: AppBar(
        title: Text('Student List', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(20),
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Manage Students',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Enter Student Name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person, color: Colors.blueAccent),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter Student Age',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.cake, color: Colors.blueAccent),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    labelText: 'Enter Student Address',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.home, color: Colors.blueAccent),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please fill in all fields correctly.')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        child: Text('Add', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final name = _nameController.text.trim();

                        if (name.isNotEmpty) {
                          context.read<StudentListBloc>().add(RemoveStudentEvent(name));
                          _nameController.clear();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please enter a valid name to remove.')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        child: Text('Remove', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  child: BlocBuilder<StudentListBloc, List<Student>>(
                    builder: (context, studentList) {
                      if (studentList.isEmpty) {
                        return Center(
                          child: Text(
                            'No students added yet.',
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      }
                      return ListView.builder(
                        itemCount: studentList.length,
                        itemBuilder: (context, index) {
                          final student = studentList[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Text(student.name[0]),
                              ),
                              title: Text(student.name),
                              subtitle: Text('Age: ${student.age}\nAddress: ${student.address}'),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
