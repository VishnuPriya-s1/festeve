import 'package:flutter/material.dart';
import 'package:festeve/homepage.dart';
import 'package:festeve/register.dart';
import 'eventlist.dart';

import 'package:festeve/eventwise.dart';
import 'package:festeve/results.dart';

class ScoreboardPage extends StatelessWidget {
  final List<Department> departments = [
    Department(name: 'Department A', scores: [80, 75, 90, 85, 95]),
    Department(name: 'Department B', scores: [70, 85, 75, 80, 90]),
    Department(name: 'Department C', scores: [90, 95, 80, 85, 70]),
    Department(name: 'Department D', scores: [85, 80, 75, 70, 95]),
    Department(name: 'Department E', scores: [75, 70, 85, 90, 80]),
  ];

  final List<Color> departmentColors = [
    const Color.fromARGB(255, 105, 80, 62),
    Colors.brown,
    const Color.fromARGB(245, 115, 85, 52),
    Colors.brown,
    const Color.fromARGB(255, 105, 80, 62),
  ];

  ScoreboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.symmetric(
              vertical: 30), // Increase vertical margin for height
          child: const Center(
            child: Text(
              'ScoreBoard',
              style: TextStyle(
                color: Colors.deepOrangeAccent,
                fontStyle: FontStyle.italic,
                fontSize: 35,
              ),
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 56, 52, 52),
        automaticallyImplyLeading: false, // Remove the back option
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.black,
              Colors.black.withOpacity(0.8),
              Colors.black.withOpacity(0.5),
            ],
          ),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                ...List.generate(
                  departments.length,
                  (index) => Container(
                    width: MediaQuery.of(context).size.width *
                        0.6, // 80% of screen width
                    margin: const EdgeInsets.all(10), // Add margin for spacing
                    padding:
                        const EdgeInsets.all(15), // Add padding for the content
                    decoration: BoxDecoration(
                      color: departmentColors[
                          index], // Unique color for each department
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                    ),
                    child: DepartmentScoreEntry(
                      department: departments[index].name,
                      totalScore: departments[index].calculateTotalScore(),
                    ),
                  ),
                ),
                const SizedBox(
                    height: 20), // Add space above the ElevatedButton
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyAppWithEventList()));

                    // Add functionality for the 'eventwise' button
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.deepOrangeAccent),
                    minimumSize: WidgetStateProperty.all(
                        const Size(40, 40)), // Adjust minimum button size
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Adjust border radius
                      ),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5), // Adjust padding for button width
                    child: Text(
                      'Eventwise',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ), // Adjust font size
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Register',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Scoreboard',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        currentIndex: 1,
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const EventPage()));
              break;
            case 1:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegistrationPage()));
              break;
            case 2:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ScoreboardPage()));
              break;
          }
        },
      ),
    );
  }
}

class DepartmentScoreEntry extends StatelessWidget {
  final String department;
  final int totalScore;

  const DepartmentScoreEntry(
      {super.key, required this.department, required this.totalScore});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          department,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          totalScore.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
