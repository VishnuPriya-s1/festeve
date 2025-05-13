import 'login_screen.dart';
import 'register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'adminview.dart';
import 'volunteer.dart';
import 'homepage.dart';
import 'results.dart';
import 'score.dart';
import 'package:flutter/widgets.dart';
import 'user.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //title: const Text('Events'),
      //backgroundColor: Colors.black,
      //),

      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.black,
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.5),
              ],
            ),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(),
                    ),
                  ),
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Center(
                          child: Text(
                            'FestEve!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 44,
                              color: Colors.orange,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                      PopupMenuButton(
                        color: Colors.white, // Change menu color to white
                        itemBuilder: (BuildContext context) {
                          return [
                            const PopupMenuItem(
                              value: 'admin',
                              child: Text('Admin Access'),
                            ),
                            const PopupMenuItem(
                              value: 'volunteer',
                              child: Text('Volunteer Access'),
                            ),
                          ];
                        },
                        onSelected: (value) {
                          if (value == 'admin') {
                            // Navigate to AdminViewPage
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EventEditPage(),
                              ),
                            );
                          } else if (value == 'volunteer') {
                            // Handle volunteer access
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const VolunteerPage(),
                              ),
                            );
                          }
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.logout_outlined,
                            color: Colors.white),
                        onPressed: () {
                          // Implement logout functionality
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 60,
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.notifications,
                        color: Colors.grey,
                        size: 25,
                      ),
                      SizedBox(width: 10.0),
                      Center(
                        child: Text(
                          'Notification',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(child: _buildSquareBox('IT')),
                    const SizedBox(width: 10),
                    Flexible(child: _buildSquareBox('CS')),
                    const SizedBox(width: 10),
                    Flexible(child: _buildSquareBox('MECH')),
                    const SizedBox(width: 10),
                  ],
                ),
                const Text(
                  'Events Today:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50), // Equal space on both sides
                    child: Center(
                      // Center the table
                      child: Table(
                        defaultColumnWidth: const FixedColumnWidth(200.0),
                        border: TableBorder.all(color: Colors.black, width: 1),
                        children: [
                          // TableRow(
                          //   children: [
                          //     _buildDownwardRectangularBox('Time'),
                          //     _buildDownwardRectangularBox('Stage 1'),
                          //     _buildDownwardRectangularBox('Stage 2'),
                          //     _buildDownwardRectangularBox('Stage 3'),
                          //   ],
                          // ),
                          TableRow(
                            children: [
                              _buildDownwardRectangularBox('TIME', [
                                '10:00 AM',
                                '',
                                '11:00 AM',
                                '',
                                '12:00 PM',
                                '',
                                '1:00 PM',
                                '',
                                '3:00 PM',
                                '',
                              ]),
                              _buildDownwardRectangularBox('STAGE 1', [
                                'THIRUVATHIRA',
                                '',
                                'MARGAM KALI',
                                '',
                                'OPPANA',
                                '',
                                'KOLUKALI',
                                '',
                                'DHAFF MUTTU'
                              ]),
                              _buildDownwardRectangularBox('STAGE 2', [
                                'BHARATANATYAM',
                                '',
                                'KUCHUPUDI',
                                '',
                                'MOHINIYATTAM',
                                '',
                                'SEMI CLASSICAL ',
                                '',
                                'WESTERN DANCE',
                                '',
                                'FOLK DANCE'
                              ]),
                              _buildDownwardRectangularBox('STAGE 3', [
                                'RECITATION(MAL)',
                                '',
                                'LIGHT MUSIC',
                                '',
                                'CLASSICAL MUSIC',
                                '',
                                'RECITATION(ENG)',
                                '',
                                'GROUP SONG',
                                '',
                                'NADAN PATTU'
                              ]),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text('Options'),
            ),
            ListTile(
              title: const Text('Admin View'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EventEditPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Volunteer View'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const VolunteerPage()),
                );
              },
            ),
          ],
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

  Widget _buildSquareBox(String hint) {
    return Container(
      width: 100,
      height: 100,
      margin: const EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(hint,
            style: const TextStyle(
                color: Colors.black, fontStyle: FontStyle.italic)),
      ),
    );
  }

  // Widget _buildDownwardRectangularBox(String hint) {
  //   return Container(
  //     width: 310,
  //     height: 450,
  //     margin: const EdgeInsets.all(8.0),
  //     padding: const EdgeInsets.all(8.0),
  //     decoration: BoxDecoration(
  //       color: Colors.orange.shade100,
  //       border: Border.all(color: Colors.grey),
  //       borderRadius: BorderRadius.circular(4.0),
  //     ),
  //     child: SingleChildScrollView(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           Text(
  //             hint,
  //             textAlign: TextAlign.center,
  //             style: const TextStyle(fontSize: 19.0),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _buildDownwardRectangularBox(String header, List<String> textList) {
    return Container(
      width: 310,
      height: 450,
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.orange.shade100,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              header,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 19.0,
                fontWeight: FontWeight.bold, // Make the text bold
                color: Colors.brown, // Change the color to blue
              ),
            ),
            SizedBox(height: 10),
            ...textList.map((text) {
              return Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14.0),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: EventPage(),
  ));
}
