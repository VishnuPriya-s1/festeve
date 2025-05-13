import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScoreboardPage1(),
    );
  }
}

class ScoreboardPage1 extends StatelessWidget {
  final List<Department> departments = [
    Department(name: 'Department A'),
    Department(name: 'Department B'),
    Department(name: 'Department C'),
    Department(name: 'Department D'),
    Department(name: 'Department E'),
  ];

  ScoreboardPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Scoreboard',
          style: TextStyle(color: Colors.orange),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: departments.length,
        itemBuilder: (context, index) {
          final department = departments[index];
          return DepartmentScoreEntry(
            department: department.name,
            totalScore: department.calculateTotalScore(),
          );
        },
      ),
    );
  }
}

class Department {
  final String name;
  final List<int> scores;

  Department({
    required this.name,
    this.scores = const [0, 0, 0, 0, 0], // Initialize with 5 zeroes
  });

  int calculateTotalScore() {
    return scores.reduce((value, element) => value + element);
  }
}

class DepartmentScoreEntry extends StatelessWidget {
  final String department;
  final int totalScore;

  const DepartmentScoreEntry({
    super.key,
    required this.department,
    required this.totalScore,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        department,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text('Total Score: $totalScore'),
    );
  }
}
