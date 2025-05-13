import 'package:flutter/material.dart';

void main() {
  runApp(MyAppWithEventList()); // Corrected class name
}

class MyAppWithEventList extends StatefulWidget {
  @override
  _MyAppWithEventListState createState() => _MyAppWithEventListState();
}

class _MyAppWithEventListState extends State<MyAppWithEventList> {
  // List of events
  List<String> events = ['Event 1', 'Event 2', 'Event 3', 'Event 4'];

  // Set to keep track of selected events
  Set<String> selectedEvents = {};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Greetings'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'hai',
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              // Specify the type explicitly
              decoration: InputDecoration(
                labelText: 'Event List',
                border: OutlineInputBorder(),
              ),
              items: [
                DropdownMenuItem(
                  value: 'Select events',
                  child: Text('Select events'),
                ),
                ...events.map((event) {
                  return DropdownMenuItem(
                    value: event,
                    child: CheckboxListTile(
                      title: Text(event),
                      value: selectedEvents.contains(event),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value != null) {
                            if (value) {
                              selectedEvents.add(event);
                            } else {
                              selectedEvents.remove(event);
                            }
                          }
                        });
                      },
                    ),
                  );
                }).toList(),
              ],
              onChanged: (String?
                  value) {}, // Empty onChanged to prevent dropdown value change
              isExpanded: true,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.black),
              itemHeight:
                  null, // Remove itemHeight to let the dropdown adjust its size
            ),
            SizedBox(height: 20),
            Text('Selected Events: ${selectedEvents.join(", ")}'),
          ],
        ),
      ),
    );
  }
}
