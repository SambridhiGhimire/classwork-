import 'package:flutter/material.dart';
import '../blocs/simple_interest/simple_interest_bloc.dart';
import '../blocs/simple_interest/simple_interest_event.dart';

class SimpleInterestScreen extends StatelessWidget {
  final TextEditingController _principalController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Interest')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _principalController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Principal Amount'),
            ),
            TextField(
              controller: _rateController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Rate of Interest'),
            ),
            TextField(
              controller: _timeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Time (Years)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final principal = double.tryParse(_principalController.text);
                final rate = double.tryParse(_rateController.text);
                final time = double.tryParse(_timeController.text);

                if (principal != null && rate != null && time != null) {
                  context
                      .read<SimpleInterestBloc>()
                      .add(CalculateInterestEvent(principal, rate, time));
                }
              },
              child: Text('Calculate Interest'),
            ),
            SizedBox(height: 20),
            BlocBuilder<SimpleInterestBloc, double>(
              builder: (context, interest) {
                return Text(
                  'Calculated Interest: $interest',
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
