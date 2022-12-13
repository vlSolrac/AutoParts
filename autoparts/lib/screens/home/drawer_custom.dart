import 'package:autoparts/screens/screens.dart';
import 'package:flutter/material.dart';

import 'package:autoparts/themes/theme.dart';

import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class DrawerCustomScreen extends StatefulWidget {
//Parametes.

  const DrawerCustomScreen({super.key});

  @override
  State<DrawerCustomScreen> createState() => _DrawerCustomScreenState();
}

class _DrawerCustomScreenState extends State<DrawerCustomScreen> {
  List<ScreenHiddenDrawer> _pages = [];
  @override
  void initState() {
    super.initState();
    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "My Car",
          baseStyle: const TextStyle(),
          selectedStyle: const TextStyle(),
        ),
        const HomeScreen(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    //global variables.
    // final size = MediaQuery.of(context).size;
    // final statusBar = MediaQuery.of(context).viewPadding;
    return HiddenDrawerMenu(
      backgroundColorMenu: ThemeApp.primary,
      screens: _pages,
      initPositionSelected: 0,
      elevationAppBar: 0,
      actionsAppBar: [
        CircleAvatar()
      ],
      
    );
  }
}
