import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:umla_assignment_app/models/medicine_model.dart';
import 'package:umla_assignment_app/providers/medicine_provider.dart';

class AddMedicinePage extends StatefulWidget {
  @override
  _AddMedicinePageState createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  IconData _selectedIcon = Icons.water_drop;
  String _selectedStatus = "Taken";
  String _selectedTime = "before breakfast";

  final List<String> statusOptions = ["Taken", "Missed", "Skipped"];
  final List<String> timeOptions = [
    "before breakfast",
    "after breakfast",
    "before lunch",
    "after lunch",
    "before dinner",
    "after dinner"
  ];

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newMedicine = Medicine(
        id: DateTime.now().millisecondsSinceEpoch, // Unique ID
        name: _nameController.text,
        status: _selectedStatus,
        icon: _selectedIcon,
        time: _selectedTime,
      );

      Provider.of<MedicineProvider>(context, listen: false).addMedicine(newMedicine);
      _nameController.clear();
      setState(() {
        _selectedStatus = statusOptions.first;
        _selectedTime = timeOptions.first;
        _selectedIcon = Icons.water_drop;
      });

      // Show confirmation dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Medicine Added"),
            content: Text("The medicine has been added to the medicine list."),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.grey[700]),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.deepPurple),
      ),
      filled: true,
      fillColor: Colors.grey[100],
      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Medicine'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: _inputDecoration('Medicine Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a medicine name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: _selectedStatus,
                  decoration: _inputDecoration('Status'),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedStatus = newValue!;
                    });
                  },
                  items: statusOptions.map((String status) {
                    return DropdownMenuItem<String>(
                      value: status,
                      child: Text(status),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: _selectedTime,
                  decoration: _inputDecoration('Time'),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedTime = newValue!;
                    });
                  },
                  items: timeOptions.map((String time) {
                    return DropdownMenuItem<String>(
                      value: time,
                      child: Text(time),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<IconData>(
                  value: _selectedIcon,
                  decoration: _inputDecoration('Select Icon'),
                  onChanged: (IconData? newIcon) {
                    setState(() {
                      _selectedIcon = newIcon!;
                    });
                  },
                  items: [
                    DropdownMenuItem(
                      value: Icons.water_drop,
                      child: Icon(Icons.water_drop),
                    ),
                    DropdownMenuItem(
                      value: Icons.medication,
                      child: Icon(Icons.medication),
                    ),
                    DropdownMenuItem(
                      value: Icons.medical_services,
                      child: Icon(Icons.medical_services),
                    ),
                    DropdownMenuItem(
                      value: Icons.local_pharmacy,
                      child: Icon(Icons.local_pharmacy),
                    ),
                    DropdownMenuItem(
                      value: Icons.healing,
                      child: Icon(Icons.healing),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: _submitForm,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.cyan,
                      ),
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          "Add Medicine",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
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
