import 'package:exeo/provider/profil_provider.dart';
import 'package:exeo/screens/map.dart';
import 'package:exeo/screens/profil.dart';
import 'package:exeo/screens/reception.dart';
import 'package:exeo/screens/search.dart';
import 'package:exeo/screens/swipe.dart';
import 'package:exeo/services/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class NavBarPage extends ConsumerWidget {
  const NavBarPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavBarWidget(),
    );
  }
}

class NavBarWidget extends ConsumerStatefulWidget {
  const NavBarWidget({Key? key}) : super(key: key);

  @override
  NavBarWidgetState createState() => NavBarWidgetState();
}

class NavBarWidgetState extends ConsumerState<NavBarWidget> {
  final List<Widget> _widgetOptions = [];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _widgetOptions.addAll([
      const ReceptionPage(),
      const SearchPageWidget(),
      const SwipeWidget(),
      const MapWidget(),
      const ProfilWidget()
    ]);
  }

  _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;

      if (_selectedIndex == 4) {
        ref.refresh(modifMyProfilProvider);
        ref.refresh(editMyPasswordProfilProvider);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: coulBlack,
        elevation: 15,
        enableFeedback: true,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesome5.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesome5.search_minus),
            label: 'Recherche',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesome5.exchange_alt),
            label: 'Swipe',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesome5.map_marked_alt),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesome5.user),
            label: 'Profil',
          ),
        ],
        selectedItemColor: coulWhite,
        unselectedItemColor: coulWhiteGrey,
        selectedIconTheme: const IconThemeData(color: coulWhite),
        unselectedIconTheme: const IconThemeData(color: coulWhite),
        selectedFontSize: 10,
        unselectedFontSize: 5,
        selectedLabelStyle: const TextStyle(fontFamily: fontRubikRegular),
        unselectedLabelStyle: const TextStyle(fontFamily: fontRubikRegular),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
