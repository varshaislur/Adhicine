import 'package:flutter/material.dart';
import 'package:umla_assignment_app/models/medicine_model.dart';

class MedicineProvider with ChangeNotifier {
  List<Medicine> _medicineList = [
    Medicine(id: 1, name: "DOLO", status: "Taken", icon: Icons.water_drop, time: "before breakfast"),
    Medicine(id: 2, name: "Dysmen", status: "Taken", icon: Icons.water_drop, time: "before lunch"),
    Medicine(id: 3, name: "piritexyl", status: "Taken", icon: Icons.water_drop, time: "after lunch"),
    Medicine(id: 4, name: "combiflam", status: "Taken", icon: Icons.water_drop, time: "after dinner"),
    Medicine(id: 5, name: "Paracetamol", status: "Missed", icon: Icons.medication, time: "before breakfast"),
    Medicine(id: 6, name: "Aspirin", status: "Taken", icon: Icons.medical_services, time: "after breakfast"),
    Medicine(id: 7, name: "Ibuprofen", status: "Skipped", icon: Icons.healing, time: "before lunch"),
    Medicine(id: 8, name: "Amoxicillin", status: "Taken", icon: Icons.local_pharmacy, time: "after lunch"),
    Medicine(id: 9, name: "Cetrizine", status: "Missed", icon: Icons.medication, time: "before dinner"),
    Medicine(id: 10, name: "Metformin", status: "Taken", icon: Icons.medical_services, time: "after dinner"),
    Medicine(id: 11, name: "Atorvastatin", status: "Skipped", icon: Icons.healing, time: "before breakfast"),
    Medicine(id: 12, name: "Omeprazole", status: "Taken", icon: Icons.local_pharmacy, time: "before lunch"),
    Medicine(id: 13, name: "Losartan", status: "Missed", icon: Icons.medication, time: "after lunch"),
    Medicine(id: 14, name: "Lisinopril", status: "Taken", icon: Icons.medical_services, time: "before dinner"),
    Medicine(id: 15, name: "Levothyroxine", status: "Skipped", icon: Icons.healing, time: "after dinner"),
    Medicine(id: 16, name: "Simvastatin", status: "Taken", icon: Icons.local_pharmacy, time: "before breakfast"),
    Medicine(id: 17, name: "Gabapentin", status: "Missed", icon: Icons.medication, time: "before lunch"),
    Medicine(id: 18, name: "Amlodipine", status: "Taken", icon: Icons.medical_services, time: "after lunch"),
    Medicine(id: 19, name: "Prednisone", status: "Skipped", icon: Icons.healing, time: "before dinner"),
    Medicine(id: 20, name: "Azithromycin", status: "Taken", icon: Icons.local_pharmacy, time: "after dinner"),
  ];

  List<Medicine> get medicineList => _medicineList;

  void addMedicine(Medicine medicine) {
    _medicineList.insert(0, medicine);
    notifyListeners();
  }

  void updateMedicine(int id, Medicine updatedMedicine) {
    final index = _medicineList.indexWhere((med) => med.id == id);
    if (index != -1) {
      _medicineList[index] = updatedMedicine;
      notifyListeners();
    }
  }

  void removeMedicine(int id) {
    _medicineList.removeWhere((med) => med.id == id);
    notifyListeners();
  }
  int get takenCount => _medicineList.where((med) => med.status == "Taken").length;
  int get missedCount => _medicineList.where((med) => med.status == "Missed").length;
  int get skippedCount => _medicineList.where((med) => med.status == "Skipped").length;
}
