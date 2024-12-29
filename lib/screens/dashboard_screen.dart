import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/area'),
              child: Text('Area of Circle'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/interest'),
              child: Text('Simple Interest'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/students'),
              child: Text('Student List'),
            ),
          ],
        ),
      ),
    );
  }
}
