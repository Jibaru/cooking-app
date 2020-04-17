import 'package:flutter/material.dart';
import 'package:cooking_app/utilities/custom_colors.dart';
import 'package:cooking_app/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _currentIndex;
  List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _screens = [
      HomeScreen(),
      HomeScreen(),
      HomeScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (selectedIndex) => setState(() => _currentIndex = selectedIndex),
          items: [
            _createBottomItem(Icons.home),
            _createBottomItem(Icons.favorite),
            _createBottomItem(Icons.person_pin)
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _createBottomItem(IconData icon){
    return BottomNavigationBarItem(
      icon: Icon(icon, color: Colors.grey,),
      activeIcon: Icon(icon, color: CustomColors.yellow),
      title: SizedBox.shrink()
    );
  }
}