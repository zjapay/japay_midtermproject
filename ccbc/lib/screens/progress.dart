import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  final List<Map<String, dynamic>> _progressData = [];
  final TextEditingController _bmiController = TextEditingController();
  final TextEditingController _caloriesController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _addProgress() {
    if (_bmiController.text.isNotEmpty && _caloriesController.text.isNotEmpty) {
      setState(() {
        _progressData.add({
          'date': _selectedDate,
          'bmi': double.tryParse(_bmiController.text) ?? 0,
          'calories': double.tryParse(_caloriesController.text) ?? 0,
        });
        _bmiController.clear();
        _caloriesController.clear();
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Progress"),
        backgroundColor: Colors.pink[300], // AppBar pink color
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink[100]!, Colors.white], // Pink gradient background
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat('yyyy-MM-dd').format(_selectedDate),
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _bmiController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter BMI",
                filled: true,
                fillColor: Colors.white, // Input background color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _caloriesController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter Total Calories",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addProgress,
                  style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40), // Adjusted padding
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  backgroundColor: Colors.pink[300], // Button color
                elevation: 4,
          ),
            child: const Text(
                "Add Progress",
                  style: TextStyle(fontSize: 16), // Slightly increased font size
         ),
        ),

            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _progressData.length,
                itemBuilder: (context, index) {
                  final data = _progressData[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    color: Colors.pink[50], // Card background color
                    child: ListTile(
                      title: Text("Date: ${DateFormat('yyyy-MM-dd').format(data['date'])}"),
                      subtitle: Text("BMI: ${data['bmi']} - Calories: ${data['calories']} kcal"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
