import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../pages/beranda_page.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  // Halaman yang ditampilkan
  List<Widget> _buildScreens() {
    return const [
      BerandaPage(),
      Center(child: Text("Produk")),
      Center(child: Text("Polisku")),
      Center(child: Text("Kontak")),
      Center(child: Text("Lainnya")),
    ];
  }

  // Item di nav bar
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.house, size: 24),
        title: "Beranda",
        activeColorPrimary: const Color(0xFF8CCDEB),
        inactiveColorPrimary: const Color(0xFFFFFFFF),
        contentPadding: 0,
      ),
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.shieldHeart, size: 24),
        title: "Produk",
        activeColorPrimary: const Color(0xFF8CCDEB),
        inactiveColorPrimary: const Color(0xFFFFFFFF),
        contentPadding: 0,
      ),
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.file, size: 24),
        title: "Polisku",
        activeColorPrimary: const Color(0xFF8CCDEB),
        inactiveColorPrimary: const Color(0xFFFFFFFF),
        contentPadding: 0,
      ),
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.phone, size: 24),
        title: "Kontak",
        activeColorPrimary: const Color(0xFF8CCDEB),
        inactiveColorPrimary: const Color(0xFFFFFFFF),
        contentPadding: 0,
      ),
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.ellipsis, size: 24),
        title: "Lainnya",
        activeColorPrimary: const Color(0xFF8CCDEB),
        inactiveColorPrimary: const Color(0xFFFFFFFF),
        contentPadding: 0,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          backgroundColor: const Color(0xFF005285),
          navBarHeight: 65,
          decoration: const NavBarDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            colorBehindNavBar: Color(0xFFFFFFFF),
          ),
          navBarStyle: NavBarStyle.style3,
        ),
      ),
    );
  }
}
