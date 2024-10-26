import 'package:flutter/material.dart';

class CalorieCount extends StatelessWidget {
  const CalorieCount({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController proteinController = TextEditingController();
    final TextEditingController carbController = TextEditingController();
    final TextEditingController fatController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calorie Intake Calculator'),
        centerTitle: true,
        backgroundColor: Colors.green[300], // AppBar color
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green[100]!, Colors.white], // Gradient background
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter your intake for each macronutrient:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildTextField(proteinController, 'Protein (grams)'),
            const SizedBox(height: 16),
            _buildTextField(carbController, 'Carbohydrates (grams)'),
            const SizedBox(height: 16),
            _buildTextField(fatController, 'Fats (grams)'),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {}, // No action performed
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  backgroundColor: Colors.lightGreen[300], // Button color
                ),
                child: const Text('Calculate Total Calories', style: TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Total Calories: 0.00 kcal', // Static text
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build styled text fields
  Widget _buildTextField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
      ),
    );
  }
}
