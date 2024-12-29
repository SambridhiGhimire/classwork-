import 'package:classassignment2/blocs/area_of_circle/area_of_circle_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/area_of_circle/area_of_circle_bloc.dart';

class AreaOfCircleScreen extends StatelessWidget {
  final TextEditingController _radiusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Area of Circle')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _radiusController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Radius'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final radius = double.tryParse(_radiusController.text);
                if (radius != null) {
                  context.read<AreaOfCircleBloc>().add(CalculateAreaEvent(radius));
                }
              },
              child: Text('Calculate Area'),
            ),
            SizedBox(height: 20),
            BlocBuilder<AreaOfCircleBloc, double>(
              builder: (context, area) {
                return Text(
                  'Calculated Area: $area',
                  style: TextStyle(fontSize: 18),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
