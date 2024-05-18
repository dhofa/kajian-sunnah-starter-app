import 'package:flutter/material.dart';
import 'package:myapp/pages/bookmark_page.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/pages/profile_page.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;

  static const List<Widget> _titles = <Widget>[
    Text('Home Page',
      style: TextStyle(
        fontSize: 20,
        color: Colors.black87,
        fontWeight: FontWeight.w500,
      ),
    ),
    Text('Bookmark Page',
      style: TextStyle(
        fontSize: 20,
        color: Colors.black87,
        fontWeight: FontWeight.w500,
      ),
    ),
    Text('Profile Page',
      style: TextStyle(
        fontSize: 20,
        color: Colors.black87,
        fontWeight: FontWeight.w500,
      ),
    ),
  ];

  static const List<Widget> _pages = <Widget>[
    HomePage(),
    BookmarkPage(),
    ProfilePage()
    // Icon(
    //   Icons.chat,
    //   size: 150,
    // ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _titles[_selectedIndex],
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      drawer: Drawer(
      child: ListView(
        padding: const EdgeInsets.only(
          top: 16,
          left: 8,
          right: 8,
        ),
        children: [
          ListTile(
            leading: const Icon(
              Icons.home,
            ),
            title: const Text('Page 1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.train,
            ),
            title: const Text('Page 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: 'Bookmark',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.verified_user),
                label: 'Profile',
              ),
              
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}