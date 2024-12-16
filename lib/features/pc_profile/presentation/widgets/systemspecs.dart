import 'package:flutter/material.dart';
import 'package:my_profile_app/features/pc_profile/domain/system_specs_model.dart';

class SystemSpecsWidget extends StatelessWidget {
  final SystemSpecs systemSpecs;
  const SystemSpecsWidget({super.key, required this.systemSpecs});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 350,
        width: 500,
        margin: const EdgeInsets.only(
          top: 20,
          bottom: 10,
        ),
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 60, 70, 126),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          children: [
            buildSpecsRow(
                'CPU', systemSpecs.cpuModel, 32, getColorForPercentage(32)),
            buildSpecsRow(
                'RAM', systemSpecs.ramModel, 32, getColorForPercentage(32)),
            buildSpecsRow('Graphics', systemSpecs.graphicsModel, 93,
                getColorForPercentage(93)),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              width: 350,
              height: 60,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 144, 98, 201),
                    Color.fromARGB(255, 55, 105, 241)
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.7),
                    offset: const Offset(6, 6),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  "SHOW SPECS UPGRADES",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getColorForPercentage(int percentage) {
    if (percentage <= 40) {
      return Colors.green;
    } else if (percentage <= 80) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }

  Widget buildSpecsRow(
      String label, String value, int percentage, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: percentage / 100,
                  color: color,
                  backgroundColor: Colors.white24,
                  strokeWidth: 4,
                ),
                Center(
                  child: Text(
                    '$percentage%',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
