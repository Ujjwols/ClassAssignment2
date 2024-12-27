import 'package:flutter/material.dart';

class ArithmeticCubitView extends StatefulWidget {
  const ArithmeticCubitView({super.key});

  @override
  State<ArithmeticCubitView> createState() => _ArithmeticCubitViewState();
}

class _ArithmeticCubitViewState extends State<ArithmeticCubitView> {
  final firstController = TextEditingController(text: '');
  final secondController = TextEditingController(text: '');
  int result = 0;
  final myKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CW2 Arithmetic Operations'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: myKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Perform Arithmetic Operations',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: firstController,
                label: 'Enter First Number',
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: secondController,
                label: 'Enter Second Number',
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Result: $result',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildActionButton(
                    label: 'Addition',
                    onPressed: () {
                      if (myKey.currentState!.validate()) {
                        setState(() {
                          result = int.parse(firstController.text) +
                              int.parse(secondController.text);
                        });
                      }
                    },
                  ),
                  _buildActionButton(
                    label: 'Subtraction',
                    onPressed: () {
                      if (myKey.currentState!.validate()) {
                        setState(() {
                          result = int.parse(firstController.text) -
                              int.parse(secondController.text);
                        });
                      }
                    },
                  ),
                  _buildActionButton(
                    label: 'Multiplication',
                    onPressed: () {
                      if (myKey.currentState!.validate()) {
                        setState(() {
                          result = int.parse(firstController.text) *
                              int.parse(secondController.text);
                        });
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a value';
        }
        if (int.tryParse(value) == null) {
          return 'Please enter a valid number';
        }
        return null;
      },
    );
  }

  Widget _buildActionButton({
    required String label,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: Colors.blueAccent,
          ),
          child: Text(
            label,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
