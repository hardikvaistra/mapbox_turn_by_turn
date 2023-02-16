import 'package:flutter/material.dart';
import '../styles/colors.dart';
import 'tabs/home_tab.dart';
import 'tabs/profile_tab.dart';
import 'tabs/schedule_tab.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

List<Map> navigationBarItems = [
  {'icon': Icons.home, 'index': 0},
  {'icon': Icons.calendar_month, 'index': 1},
  {'icon': Icons.person, 'index': 2},
];

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  void goToSchedule() {
    setState(() {
      _selectedIndex = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomeTab(onPressedScheduleCard: goToSchedule),
      const ScheduleTab(),
      const ProfileTab(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: screens[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        selectedItemColor: MyColors.primary,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          for (var navigationBarItem in navigationBarItems)
            BottomNavigationBarItem(
              icon: Container(
                height: 55,
                decoration: BoxDecoration(
                  border: Border(
                    top: _selectedIndex == navigationBarItem['index']
                        ? BorderSide(color: MyColors.bg01, width: 5)
                        : BorderSide.none,
                    bottom: _selectedIndex == navigationBarItem['index']
                        ? const BorderSide(color: Colors.transparent, width: 5)
                        : BorderSide.none,
                  ),
                ),
                child: Icon(
                  navigationBarItem['icon'],
                  color: _selectedIndex == navigationBarItem['index']
                      ? MyColors.bg01
                      : MyColors.bg02,
                  size: 30,
                ),
              ),
              label: '',
            ),
        ],
        currentIndex: _selectedIndex,
        onTap: (value) => setState(() {
          _selectedIndex = value;
        }),
      ),
    );
  }
}
