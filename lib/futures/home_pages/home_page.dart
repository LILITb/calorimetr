import 'package:caloriegram/futures/base_screen/base_screen.dart';
import 'package:caloriegram/futures/camera_screen/camera_screen.dart';
import 'package:caloriegram/futures/profile_screen/view/profile_screen.dart';
import 'package:caloriegram/futures/saves_page/view/saves_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../ui/theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedPageIndex = 0;

  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: PageView(
          controller: _pageController,
          onPageChanged: (value) {
            setState(() {
              _selectedPageIndex = value;
            });
          },
          children: const [
            BaseScreen(),
            SavesScreen(),
            CameraScreen(),
            ProfileScreen()
          ]),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.appThemeColor,
        unselectedItemColor: AppColors.blackText,
        selectedLabelStyle: theme.textTheme.bodySmall,
        showUnselectedLabels: true,
        unselectedLabelStyle: theme.textTheme.bodySmall,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _getPage,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SvgPicture.asset(
                'assets/icons/home.svg',
                colorFilter:
                    const ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
              ),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SvgPicture.asset(
                'assets/icons/home.svg',
                colorFilter: const ColorFilter.mode(
                    AppColors.appThemeColor, BlendMode.srcIn),
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SvgPicture.asset('assets/icons/saves.svg'),
            ),
            label: 'Saves',
            activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SvgPicture.asset(
                'assets/icons/saves.svg',
                colorFilter: const ColorFilter.mode(
                    AppColors.appThemeColor, BlendMode.srcIn),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SvgPicture.asset('assets/icons/camera.svg'),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SvgPicture.asset(
                'assets/icons/camera.svg',
                colorFilter: const ColorFilter.mode(
                    AppColors.appThemeColor, BlendMode.srcIn),
              ),
            ),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SvgPicture.asset('assets/icons/profile.svg'),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SvgPicture.asset(
                'assets/icons/profile.svg',
                colorFilter: const ColorFilter.mode(
                    AppColors.appThemeColor, BlendMode.srcIn),
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void _getPage(int index) {
    setState(() {
      _selectedPageIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 400), curve: Curves.linear);
    });
  }
}
