import 'package:class_assignment_two/cubit/simpleintereset_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleInterestCubitView extends StatelessWidget {
  const SimpleInterestCubitView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController principalController = TextEditingController();
    final TextEditingController rateController = TextEditingController();
    final TextEditingController timeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('CW2 Simple Interest Calculator'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: principalController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Principal Amount',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: rateController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Rate of Interest',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: timeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Time ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: BlocBuilder<SimpleInterestCubit, double>(
                  builder: (context, interest) {
                    return Text(
                      'Simple Interest: ${interest.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final principal =
                      double.tryParse(principalController.text) ?? 0.0;
                  final rate = double.tryParse(rateController.text) ?? 0.0;
                  final time = double.tryParse(timeController.text) ?? 0.0;
                  context
                      .read<SimpleInterestCubit>()
                      .calculate(principal, rate, time);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.blueAccent,
                ),
                child: const Text(
                  'Calculate Interest',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
