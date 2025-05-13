import 'package:flutter/material.dart';

class EventwisePage extends StatelessWidget {
  const EventwisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove back button
        title: null,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black, Colors.black.withOpacity(0.5)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.black,
              child: const Text(
                'Event Wise',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40), // Adjust the horizontal padding as needed
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6, // 4 squares per row
                    mainAxisSpacing: 20, // Spacing between rows
                    crossAxisSpacing: 20, // Spacing between columns
                    childAspectRatio:
                        1, // Aspect ratio of the grid items (squares)
                  ),
                  itemCount: 25, // Total number of squares
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        color:
                            Colors.red.shade100, // Set the color of the square
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black, // Set the shadow color to grey
                            offset:
                                Offset(2, 2), // Set the offset of the shadow
                            blurRadius: 4, // Set the blur radius of the shadow
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          (index + 1)
                              .toString(), // Display the index of the square
                          style: const TextStyle(
                            color: Colors.orange, // Set text color to white
                            fontSize: 18, // Adjust font size if needed
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
