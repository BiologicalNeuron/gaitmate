import 'package:flutter/material.dart';
import './account_screen.dart';
import './dashboard_screen.dart';
import './add_activity_screen.dart';

class TabScreen extends StatefulWidget {
  static const routeName = '/tabscreen';
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPage = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': DashboardScreen(),
        'title': 'Dashboard',
      },
      {
        'page': AddActivityScreen(),
        'title': 'Activity',
      },
      {
        'page': AccountScreen(),
        'title': 'Accounts',
      }
    ];

    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      //print(index);
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _pages[_selectedPage]['page'],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 36.0,
        currentIndex: _selectedPage,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).accentColor,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            title: SizedBox.shrink(),
            icon: Icon(
              Icons.dashboard,
            ),
          ),
          BottomNavigationBarItem(
            title: SizedBox.shrink(),
            icon: Icon(
              Icons.add,
            ),
          ),
          BottomNavigationBarItem(
            title: SizedBox.shrink(),
            icon: CircleAvatar(
              radius: 15.0,
              backgroundImage: NetworkImage('http://i.imgur.com/zL4Krbz.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}
