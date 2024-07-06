import 'package:anif_admin/lib/colors.dart';
import 'package:anif_admin/view/user_manage_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_view.dart';

class AnifAdminApp extends StatelessWidget {
  final _title = "AnimalFarm Administrator Tools";
  
  const AnifAdminApp({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);

    return MaterialApp(
      title: _title,
      home: const HomeWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<StatefulWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final PageController _pageController = PageController();
  final List<Widget> _widgets = [
    const HomeView(),
    const UserManageView()
  ];
  final _bottomNavigationBarItems = const <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "홈"),
    BottomNavigationBarItem(icon: Icon(Icons.person_outlined), label: "유저 관리")
  ];
  int _selectedIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          Scaffold(
            backgroundColor: AnifColors.greyCC,
            body: Center(
                child: _widgets[_selectedIndex],
            ),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                color: AnifColors.greyCC,
                borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(30),
                   topRight: Radius.circular(30),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: AnifColors.shadow,
                      blurRadius: 0,
                      offset: Offset(0, -4),
                  ),
                ],
              ),
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                child: BottomNavigationBar(
                    items: _bottomNavigationBarItems,
                    currentIndex: _selectedIndex,
                    selectedItemColor: AnifColors.grey33,
                    unselectedItemColor: AnifColors.grey78,
                    backgroundColor: AnifColors.greyF2,
                    onTap: _onItemTapped,
                )
              )
            ),
          )
        ],
      ),
    );
  }
}
