import 'package:flutter/material.dart';

class YourTeamPage extends StatefulWidget {
  const YourTeamPage({Key? key}) : super(key: key);

  @override
  _YourTeamPageState createState() => _YourTeamPageState();
}

class _YourTeamPageState extends State<YourTeamPage> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Team'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 25, // Add elevation to the card for a shadow effect
          color: Colors.blueGrey,
          shadowColor: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Event Name: Classical Music',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Stage',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  // Add your Stage content here
                  'Stage 1',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Participants:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                _buildParticipantItem('John Doe'),
                _buildParticipantItem('Jane Smith'),
                _buildParticipantItem('Alice Johnson'),
                // Add more participants as needed
                SizedBox(height: 20),
                TextField(
                  controller: _textEditingController,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Type here...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 40,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.send), // Icon to the right side
                      onPressed: () {
                        _textEditingController.clear();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildParticipantItem(String participantName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        participantName,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
