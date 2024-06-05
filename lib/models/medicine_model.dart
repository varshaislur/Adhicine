import 'package:flutter/cupertino.dart';

class Medicine{
  late int id;
  late String name;
  late String status;
  late IconData icon;
  late String time;


//constructor
  Medicine({required this.id,required this.name,required this.status,required this.icon,required this.time});
}