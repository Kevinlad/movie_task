import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_task/screens/homescreen.dart';
import 'package:movie_task/screens/search_screen.dart';

// import 'package:shared_preferences/shared_preferences.dart';

import 'responsive.dart';

// ignore: must_be_immutable
class BottomBar extends StatefulWidget {
  BottomBar({
    super.key,
    this.selectpage,
    this.cate,
  });
  late int? selectpage;

  String? cate = "Baby Shower";
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> with WidgetsBindingObserver {
  late int _currentIndex;
  late final PageController _pageController;
  final List<String> drawerItems = [
    "Home",
    "Category",
    "My Drafts",
    "My Orders",
    "More"
  ];
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });
  }

  late List<Widget> _screens;
  double _keyboardHeight = 0.0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.selectpage ?? 0;
    _pageController = PageController(initialPage: _currentIndex);
    if (widget.selectpage != null) {
      widget.selectpage = null;
    }

    _screens = [
      HomeScreen(onSearchTap: () => _onItemTapped(1)),
      SearchScreen()
    ];
  }

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: "Home",
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.search,
      ),
      label: "Search",
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.person,
      ),
      label: "Account",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        mobile: Scaffold(
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (newvalue) {
              setState(() {
                _currentIndex = newvalue;
              });
            },
            children: _screens,
          ),
          bottomNavigationBar: _keyboardHeight > 0
              ? SizedBox.shrink()
              : BottomNavigationBar(
                  backgroundColor: Color(0xFF24262B),
                  selectedItemColor: Colors.blue,
                  selectedIconTheme: const IconThemeData(color: Colors.blue),
                  unselectedItemColor: Colors.white,
                  items: _bottomNavBarItems,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: _currentIndex,
                  onTap: (index) {
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                ),
        ),
        desktop: Scaffold(
          backgroundColor: Colors.black54,
          body: Row(
            children: [
              SizedBox(
                width: 190,
                child: Scaffold(
                  body: Drawer(
                    child: ListView.builder(
                      itemCount: drawerItems.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(drawerItems[index]),
                          onTap: () {
                            setState(() {
                              _currentIndex = index;
                              _pageController.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            });
                          },
                          selected: _currentIndex == index,
                          selectedTileColor: Colors.blue.withOpacity(0.6),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: _screens[_currentIndex],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
