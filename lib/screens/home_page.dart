import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:umla_assignment_app/screens/add_medicine_page.dart';
import 'package:umla_assignment_app/screens/home_page_2.dart';
import 'package:umla_assignment_app/screens/report_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final items = const [
    Icon(Icons.home, size: 30,color: Colors.white),

    Icon(Icons.add, size: 30,color: Colors.white),
    Icon(Icons.auto_graph, size: 30,color: Colors.white)
  ];

  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: index,
        onTap: (selctedIndex){
          setState(() {
            index = selctedIndex;
          });
        },
        height: 70,
        backgroundColor: Colors.white,
        color: Colors.cyan,
        animationDuration: const Duration(milliseconds: 300),
        // animationCurve: ,
      ),
      body: Container(
          color: Colors.blue,
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: getSelectedWidget(index: index)
      ),
    );
  }

  Widget getSelectedWidget({required int index}){
    Widget widget;
    switch(index){
      case 0:
        widget = const HomePage2();
        break;
      case 1:
        widget =  AddMedicinePage();
        break;
      case 2:
        widget =  ReportPage();
        break;
      default:
        widget = const HomePage2();
        break;
    }
    return widget;
  }
}
