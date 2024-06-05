import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:umla_assignment_app/providers/medicine_provider.dart';
import 'package:umla_assignment_app/screens/profile_page.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  List<Color?> colorsList = [
    Colors.blue[200],
    Colors.yellow[100],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Homepage"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.medical_services),
                  onPressed: () {},
                ),
                SizedBox(width: 20),
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
                  },
                ),
              ],
            ),
          )
        ],
      ),
      body: Consumer<MedicineProvider>(
        builder: (context, medicineProvider, child) {
          return Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 180,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: medicineProvider.medicineList.length,
                  itemBuilder: (context, index) {
                    var colorsIndex = index % 2;
                    var medicine = medicineProvider.medicineList[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 70,
                          color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              Container(
                                color: colorsList[colorsIndex],
                                width: 70,
                                height: 70,
                                child: Icon(medicine.icon, color: Colors.white),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('${medicine.name}'),
                                    Text('${medicine.status} | ${medicine.time}',
                                        style: TextStyle(color: Colors.grey))
                                  ],
                                ),
                              ),
                              medicine.status == "Taken"
                                  ? Icon(Icons.notifications_outlined,
                                  color: Colors.green)
                                  : Icon(Icons.notifications_outlined,
                                  color: Colors.red)
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
