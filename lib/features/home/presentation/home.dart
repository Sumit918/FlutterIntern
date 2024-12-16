import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 50),
        alignment: Alignment.topCenter,
        // Main container wrapping all child containers
        child: Column(
          children: [
            // First container with text inside
            Container(
              width: 300,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  colors: [Colors.red, Colors.orange],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.7),
                    blurRadius: 10,
                    spreadRadius: 5.0,
                    offset: const Offset(-10, 10.0),
                  ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Challenge',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                    color: Color.fromARGB(255, 255, 173, 8),
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80), // Space between containers
            // Second container with text inside
            Container(
              width: 280,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 182, 232, 255),
                    Color.fromARGB(255, 0, 140, 255)
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.7, 0.7],
                ),
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Challenge',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80), // Space between containers
            // Circular container with text inside
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.orange,
                  width: 8,
                ),
              ),
              child: const Center(
                child: Text(
                  'H',
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80),
            Container(
              width: 150,
              height: 150,
              alignment: const Alignment(30, 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 255, 34, 200)
                        .withOpacity(0.8),
                    blurRadius: 0,
                    spreadRadius: 0,
                    offset: const Offset(-20, -20),
                  ),
                ],
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 255, 94, 169),
                    Color.fromARGB(255, 0, 200, 255),
                  ],
                  begin: Alignment.bottomLeft,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
