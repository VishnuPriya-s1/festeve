import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'; // For formatting dates
import 'homepage.dart';

class EventEditPage extends StatefulWidget {
  final String? eventId; // ID of the event to edit, if any

  const EventEditPage({Key? key, this.eventId}) : super(key: key);

  @override
  _EventEditPageState createState() => _EventEditPageState();
}

class _EventEditPageState extends State<EventEditPage> {
  final _formKey = GlobalKey<FormState>(); // Key for form validation
  final TextEditingController _eventNameController = TextEditingController();
  final TextEditingController _eventDateController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _ticketsController = TextEditingController();

  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    if (widget.eventId != null) {
      _loadEventData(widget.eventId!); // Load existing event data
    }
  }

  void _loadEventData(String eventId) async {
    // Fetch the event data from Firestore or any other data source
    var eventData = await FirebaseFirestore.instance
        .collection('events')
        .doc(eventId)
        .get();
    if (eventData.exists) {
      setState(() {
        _eventNameController.text = eventData['name'];
        _eventDateController.text = eventData['date'];
        _locationController.text = eventData['location'];
        _ticketsController.text = eventData['tickets'].toString();
      });
    }
  }

  @override
  void dispose() {
    _eventNameController.dispose();
    _eventDateController.dispose();
    _locationController.dispose();
    _ticketsController.dispose();
    super.dispose();
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _eventDateController.text =
            DateFormat.yMMMd().format(picked); // Display the formatted date
      });
    }
  }

  void _addOrUpdateEvent() async {
    if (_formKey.currentState!.validate()) {
      // Form validation
      var event = {
        'name': _eventNameController.text,
        'date': _eventDateController.text,
        'location': _locationController.text,
        'tickets': int.tryParse(_ticketsController.text),
      };

      if (widget.eventId != null) {
        // Update existing event
        await FirebaseFirestore.instance
            .collection('events')
            .doc(widget.eventId)
            .update(event);
      } else {
        // Add new event
        await FirebaseFirestore.instance.collection('events').add(event);
      }

      Navigator.pop(context); // Return to previous page after saving
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.eventId != null ? 'Edit Event' : 'Add New Event',
          style: TextStyle(color: Colors.brown),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Card(
            elevation: 5,
            color: Colors.brown,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _eventNameController,
                    decoration: InputDecoration(
                      labelText: 'Event Name',
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an event name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _eventDateController,
                    readOnly: true, // Date picker will be used
                    decoration: InputDecoration(
                      labelText: 'Event Date',
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () => _pickDate(context),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a date';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _locationController,
                    decoration: InputDecoration(
                      labelText: 'Location',
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a location';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _ticketsController,
                    decoration: InputDecoration(
                      labelText: 'Tickets Available',
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the number of tickets';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EventPage()),
                      );
                    },
                    // onPressed: _addOrUpdateEvent,
                    child: Text(
                      widget.eventId != null ? 'Update Event' : 'Add Event',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
