import 'package:esame_flutter/pages/favorites_page.dart';
import 'package:esame_flutter/pages/landing_page.dart';
import 'package:flutter/material.dart';

import 'components/bottomBar/bottom_bar.dart';

enum TabType {
  home(0),
  favorites(1);

  const TabType(this.indexe);
  final int indexe;
}

class ContainerPage extends StatefulWidget {
  const ContainerPage({super.key});

  @override
  State<ContainerPage> createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> with TickerProviderStateMixin {
  TabType _selectedTab = TabType.home;


  late PageController _pageController;


  final Map<TabType, Widget> _pages = {};

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedTab.index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  Widget _getPage(TabType tabType) {
    return _pages.putIfAbsent(tabType, () {
      switch (tabType) {
        case TabType.home:
          return LandingPage();
        case TabType.favorites:
          return const FavoritesPage();
      }
    });
  }

  void _onTabTapped(int index) {
    final newTab = TabType.values.firstWhere((tab) => tab.index == index);


    setState(() {
      _selectedTab = newTab;
    });

    // Anima verso la nuova pagina
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          final newTab = TabType.values.firstWhere((tab) => tab.index == index);
          if (_selectedTab != newTab) {
            setState(() {
              _selectedTab = newTab;
            });
          }
        },
        itemCount: TabType.values.length,
        itemBuilder: (context, index) {
          final tabType = TabType.values.firstWhere((tab) => tab.index == index);
          return _getPage(tabType);
        },
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: _selectedTab.index,
        onTap: _onTabTapped,
      ),
    );
  }
}

