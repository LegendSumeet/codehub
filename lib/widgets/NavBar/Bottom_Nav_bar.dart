import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../screens/HomeScreen/homepage.dart';
import '../../screens/GuidesScreen/GuidesScreen.dart';
import '../../screens/ProfileScreen/ProfileScreen.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({Key? key}) : super(key: key);

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> scalAnimation;
  late Animation<double> animation;
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {});
      });
    scalAnimation = Tween<double>(
      begin: 1,
      end: 0.8,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    ));
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    ));
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onNavBarTap(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    _animationController.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const [
          HomePage(),
          GuidesScreen(),
          PorfileScreen(),
        ],
      ),
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem("Home", IconlyBold.home, 0),
            _buildNavItem("ASK!", IconlyBold.paper, 1),
            _buildNavItem("Sessions", IconlyBold.profile, 2),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String label, IconData icon, int index) {
    return GestureDetector(
      onTap: () => _onNavBarTap(index),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: _currentIndex == index
              ? const Border(
                  top: BorderSide(color: Colors.white, width: 2),
                )
              : null,
        ),
        child: Icon(
          icon,
          color: _currentIndex == index ? Colors.white : Colors.grey,
          size: 30,
        ),
      ),
    );
  }
}
