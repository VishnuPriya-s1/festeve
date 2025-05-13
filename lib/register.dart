import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festeve/homepage.dart';
import 'package:festeve/score.dart';
// Import the necessary files

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _admissionNumberController =
      TextEditingController();
  bool _isNameFieldFocused = false;
  // bool _isEmailFieldFocused = false;
  bool _isAdmissionNumberFieldFocused = false;
  String yearSelected = '1900';
  String depSelected = '1000';
  String eventSelected = '1000';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Colors.black.withOpacity(0.8),
              Colors.black.withOpacity(0.5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        // appBar: AppBar(
        //  title: const Text('Registration'),
        //backgroundColor: Colors.black,
        //),
        // body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Registration',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 34,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              style: TextStyle(
                color: _isNameFieldFocused || _nameController.text.isNotEmpty
                    ? Colors.orange
                    : Colors.white,
              ),
              // controller: _nameController,
              // style: const TextStyle(color: Colors.orange),
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: const TextStyle(color: Colors.grey),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            _buildDepartmentDropdown(),
            const SizedBox(height: 10),
            TextFormField(
              controller: _admissionNumberController, // Updated
              style: const TextStyle(color: Colors.orange),
              decoration: InputDecoration(
                labelText: 'Admission Number', // Updated
                labelStyle: const TextStyle(color: Colors.grey),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            // TextFormField(
            //   controller: _emailController,
            //   style: const TextStyle(color: Colors.orange),
            //   decoration: InputDecoration(
            //     labelText: 'Email',
            //     labelStyle: const TextStyle(color: Colors.grey),
            //     enabledBorder: const UnderlineInputBorder(
            //       borderSide: BorderSide(color: Colors.grey),
            //     ),
            //     focusedBorder: const UnderlineInputBorder(
            //       borderSide: BorderSide(color: Colors.white),
            //     ),
            //   ),
            _buildYearDropdown(),

            const SizedBox(height: 10),
            _buildEventDropdown(),
            const SizedBox(height: 20),
            Container(
              width: 150, // Specify the desired width here
              child: ElevatedButton(
                onPressed: _register,
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.black, // background color
                  backgroundColor: Colors.orange, // foreground color (text)
                ),
                child: const Text('Register'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildYearDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Year',
        labelStyle: const TextStyle(color: Colors.grey),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      style: const TextStyle(color: Colors.orange),
      items: <String>['First Year', 'Second Year', 'Third Year', 'Fourth Year']
          .map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? value) {
        yearSelected = value!;
      },
    );
  }

  Widget _buildDepartmentDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Department',
        labelStyle: const TextStyle(color: Colors.grey),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      style: const TextStyle(color: Colors.orange),
      items: <String>['IT', 'CSE', 'ECE', 'EEE', 'MECH'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? value) {
        depSelected = value!;
      },
    );
  }

  Widget _buildEventDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Event',
        labelStyle: const TextStyle(color: Colors.grey),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      style: const TextStyle(color: Colors.orange),
      items: <String>['Event 1', 'Event 2', 'Event 3', 'Event 4']
          .map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? value) {
        eventSelected = value!;
      },
    );
  }
  // Widget _buildEventDropdown() {
  //   List<String> events = ['Event 1', 'Event 2', 'Event 3', 'Event 4'];
  //   List<String> selectedEvents = [];

  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text('Events', style: TextStyle(color: Colors.grey)),
  //       SizedBox(height: 10),
  //       ElevatedButton(
  //         onPressed: () {
  //           showDialog(
  //             context: context,
  //             builder: (BuildContext context) {
  //               return StatefulBuilder(
  //                 builder: (BuildContext context, StateSetter setState) {
  //                   return AlertDialog(
  //                     title: Text('Select Events'),
  //                     content: SizedBox(
  //                       width: double.minPositive,
  //                       height: 200,
  //                       child: ListView(
  //                         children: events.map((String eventName) {
  //                           return CheckboxListTile(
  //                             title: Text(eventName),
  //                             value: selectedEvents.contains(eventName),
  //                             onChanged: (bool? value) {
  //                               setState(() {
  //                                 if (value!) {
  //                                   selectedEvents.add(eventName);
  //                                 } else {
  //                                   selectedEvents.remove(eventName);
  //                                 }
  //                               });
  //                             },
  //                           );
  //                         }).toList(),
  //                       ),
  //                     ),
  //                     actions: [
  //                       TextButton(
  //                         onPressed: () {
  //                           Navigator.pop(context);
  //                         },
  //                         child: Text('OK'),
  //                       ),
  //                     ],
  //                   );
  //                 },
  //               );
  //             },
  //           );
  //         },
  //         child: Text('Select Events'),
  //       ),
  //       SizedBox(height: 10),
  //       Text(
  //         'Selected Events: ${selectedEvents.join(", ")}',
  //         style: TextStyle(color: Colors.grey),
  //       ),
  //     ],
  //   );
  // }

  void _register() {
    // Extract the data from the form fields
    String name = _nameController.text;
    String admissionNumber = _admissionNumberController.text;
    // String email = _emailController.text;

    // Create a map to represent the user's data
    Map<String, dynamic> userData = {
      'name': name,
      'admissionNumber': admissionNumber,
      // 'email': email,
      'year': yearSelected,
      // Add other user details here if needed
    };

    // Determine the collection reference based on the department
    CollectionReference departmentCollection =
        FirebaseFirestore.instance.collection(depSelected);

    // Check if the department collection already exists
    departmentCollection.doc(eventSelected).get().then((eventDoc) {
      if (eventDoc.exists) {
        // Event document exists, update it with the new user data
        departmentCollection.doc(eventSelected).update({
          'users': FieldValue.arrayUnion(
              [userData]), // Add the new user data to the 'users' array
        }).then((_) {
          // Registration successful
          print('Registration successful');
          // _clearFormAndResetSelections();
          // // Clear the form fields after successful registration
          // _nameController.clear();
          // _emailController.clear();
          setState(() {
            yearSelected = '1900';
            depSelected = '1000';
            eventSelected = '1000';
          });
        }).catchError((error) {
          // Registration failed
          print('Error registering: $error');
        });
      } else {
        // Event document doesn't exist, create it with the registration data
        departmentCollection.doc(eventSelected).set({
          'name': name, // Assuming eventSelected contains the event name
          'users': [
            userData
          ], // Start with an array containing the current user
        }).then((_) {
          // Registration successful
          print('Registration successful');
          // Clear the form fields after successful registration
          // _nameController.clear();
          // _emailController.clear();
          // setState(() {
          //   yearSelected = '1900';
          //   depSelected = '1000';
          //   eventSelected = '1000';
          // });
        }).catchError((error) {
          // Registration failed
          print('Error registering: $error');
        });
      }
    }).catchError((error) {
      // Error getting event document
      print('Error getting event document: $error');
    });
  }
}

Future<bool> userHasRegisteredForLessThanTwoEvents(String userName) async {
  // Assuming 'events' is the name of the collection where event documents are stored
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('events')
      .where('users', arrayContains: userName)
      .get();

  // Count the number of documents where the 'users' array contains the userName
  int count = querySnapshot.docs.length;

  // Return true if the user has registered for less than 2 events, false otherwise
  return count < 2;
}
