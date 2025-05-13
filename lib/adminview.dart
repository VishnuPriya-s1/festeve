import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class AdminViewPage extends StatelessWidget {
  const AdminViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // Remove the app bar
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black87,
              Colors.black54,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.black,
              child: const Text(
                'Admin Controls',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: _buildEventDetailsTable(),
                  ),
                  Expanded(
                    child: _buildPieChart(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventDetailsTable() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Event Details',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: SingleChildScrollView(
              child: DataTable(
                headingRowColor:
                    WidgetStateColor.resolveWith((states) => Colors.black),
                dataRowColor:
                    WidgetStateColor.resolveWith((states) => Colors.white),
                columns: const [
                  DataColumn(
                    label: Text('Event Name',
                        style: TextStyle(color: Colors.white)),
                  ),
                  DataColumn(
                    label: Text('Volunteers',
                        style: TextStyle(color: Colors.white)),
                  ),
                  DataColumn(
                    label: Text('participants',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
                rows: List.generate(
                  10,
                  (index) => DataRow(
                    cells: [
                      DataCell(Text('Event ${index + 1}')),
                      DataCell(
                        Row(
                          children: [
                            const Text('-'), // Participants field
                            IconButton(
                              icon: const Icon(Icons.add, color: Colors.black),
                              onPressed: () {
                                // Perform add action
                              },
                            ),
                            IconButton(
                              icon:
                                  const Icon(Icons.remove, color: Colors.black),
                              onPressed: () {
                                // Perform remove action
                              },
                            ),
                          ],
                        ),
                      ),
                      const DataCell(Text('-')), // Volunteers field
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPieChart() {
    // Sample data for the pie chart (replace with your actual data)
    var data = [
      Event('Event 1', 30), // Sample participation for event 1
      Event('Event 2', 20), // Sample participation for event 2
      Event('Event 3', 15), // Sample participation for event 3
      Event('Event 4', 35), // Sample participation for event 4
      Event('Event 5', 10), // Sample participation for event 5
    ];

    // Convert data to a series for the pie chart
    var series = [
      charts.Series(
        id: 'Event Participation',
        data: data,
        domainFn: (Event event, _) => event.eventName,
        measureFn: (Event event, _) => event.participation,
        labelAccessorFn: (Event event, _) =>
            '${event.eventName}: ${event.participation}%',
      ),
    ];

    // Create pie chart
    var chart = charts.PieChart(
      series,
      animate: true, // Add animation
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: chart,
    );
  }
}

class Event {
  final String eventName;
  final int participation;

  Event(this.eventName, this.participation);
}

void main() {
  runApp(MaterialApp(
    home: AdminViewPage(),
  ));
}
