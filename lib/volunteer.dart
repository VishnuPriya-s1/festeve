import 'package:festeve/team.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'team.dart';

class VolunteerPage extends StatelessWidget {
  const VolunteerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Volunteer'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications (e.g., show a list of recent notifications)
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.blueGrey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Volunteer Information
                Text(
                  'Welcome, [Volunteer Name]',
                  style: TextStyle(fontSize: 25),
                  //style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 20),

                // Assigned Events Section
                Text(
                  'Assigned Events',
                  style: TextStyle(fontSize: 19),
                  //style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 10),

                // _buildEventCard(
                //   eventName: 'Music Festival',
                //   eventDate: 'June 15, 2024',
                //   eventLocation: 'City Park',
                //   volunteerRole: 'Stage Assistant',
                // ),

                _buildEventCard(
                  eventName: ' Classical Music',
                  eventDate: 'June 25, 2024',
                  eventLocation: 'Stage 1',
                  volunteerRole: 'Registration Desk',
                ),

                const SizedBox(height: 20),

                // Task Management Section
                Text(
                  'Your Tasks',
                  style: TextStyle(fontSize: 20),
                  //style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 15),

                _buildTaskCard(
                  taskTitle: 'Check in attendees',
                  taskDescription:
                      'Assist with checking in attendees at the registration desk.',
                  dueDate: 'June 20, 2024',
                  isCompleted: false,
                ),
                _buildTaskCard(
                  taskTitle: 'Set up stage equipment',
                  taskDescription:
                      'Ensure all equipment is set up before the event starts.',
                  dueDate: 'June 25, 2024',
                  isCompleted: false,
                ),

                const SizedBox(height: 30),

                // Communication Section
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => YourTeamPage()));
                    // Navigate to a communication or chat page
                  },
                  child: const Text('Communicate with Team'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Build an event card with event details
  Widget _buildEventCard({
    required String eventName,
    required String eventDate,
    required String eventLocation,
    required String volunteerRole,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white70,
      child: ListTile(
        leading: const Icon(Icons.event),
        title: Text(eventName),
        subtitle: Text('$eventDate at $eventLocation'),
        trailing: Text(volunteerRole),
      ),
    );
  }

  // Build a task card with task details
  Widget _buildTaskCard({
    required String taskTitle,
    required String taskDescription,
    required String dueDate,
    bool isCompleted = false,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white70,
      child: ListTile(
        leading: Icon(
          isCompleted ? Icons.check_circle : Icons.circle,
          color: isCompleted ? Colors.green : Colors.grey,
        ),
        title: Text(taskTitle),
        subtitle: Text('$taskDescription\nDue: $dueDate'),
        trailing: Icon(
          isCompleted ? Icons.check : Icons.hourglass_empty,
          color: isCompleted ? Colors.green : Colors.grey,
        ),
      ),
    );
  }
}
