import 'package:flutter/material.dart';
import 'package:municipality/src/features/home/screen/home_screen.dart';

import '../../user/screen/admin/admin_screen.dart';

class HomeAdmin extends StatelessWidget {
  const HomeAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: const TabBarView(
          children: [
            HomeScreen(),
            AdminScreen(),
          ],
        ),
        bottomNavigationBar: Container(
          color: const Color(0xff343541),
          child: const TabBar(
            tabs: [
              Tab(
                text: 'Home',
                icon: Icon(Icons.home),
              ),
              Tab(
                text: 'Admin',
                icon: Icon(Icons.admin_panel_settings),
              ),
            ],
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
