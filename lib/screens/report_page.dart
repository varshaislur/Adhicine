import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:umla_assignment_app/providers/medicine_provider.dart';

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final medicineProvider = Provider.of<MedicineProvider>(context);

    final takenCount = medicineProvider.takenCount.toDouble();
    final missedCount = medicineProvider.missedCount.toDouble();
    final skippedCount = medicineProvider.skippedCount.toDouble();
    final others = (medicineProvider.medicineList.length -
        (medicineProvider.takenCount +
            medicineProvider.missedCount +
            medicineProvider.skippedCount))
        .toDouble();
    List<Color?> colorsList = [
      Colors.blue[200],
      Colors.yellow[100],
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Medicines Report',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 300, // Specify the height of the pie chart container
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: PieChart(
                        PieChartData(
                          centerSpaceRadius: 50,
                          borderData: FlBorderData(show: false),
                          sectionsSpace: 4,
                          sections: [
                            PieChartSectionData(
                              value: takenCount,
                              color: Colors.green,
                              radius: 100,
                              title: 'Taken',
                              titleStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            PieChartSectionData(
                              value: missedCount,
                              color: Colors.red,
                              radius: 100,
                              title: 'Missed',
                              titleStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            PieChartSectionData(
                              value: skippedCount,
                              color: Colors.orange,
                              radius: 100,
                              title: 'Skipped',
                              titleStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            PieChartSectionData(
                              value: others,
                              color: Colors.grey,
                              radius: 100,
                              title: 'Others',
                              titleStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Details:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                buildDetailsRow('Taken', medicineProvider.takenCount, Colors.green, Icons.check_circle),
                buildDetailsRow('Missed', medicineProvider.missedCount, Colors.red, Icons.cancel),
                buildDetailsRow('Skipped', medicineProvider.skippedCount, Colors.orange, Icons.skip_next),
                buildDetailsRow('Others', medicineProvider.medicineList.length - (medicineProvider.takenCount + medicineProvider.missedCount + medicineProvider.skippedCount), Colors.grey, Icons.help_outline),
                SizedBox(height: 20),
                Text(
                  'Medicine List',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Consumer<MedicineProvider>(
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDetailsRow(String title, int count, Color color, IconData icon) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: color),
                SizedBox(width: 10),
                Text(
                  '$title:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Text(
              '$count',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
