import 'package:flutter/material.dart';
import 'package:municipality/src/features/home/screen/home_screen.dart';

import '../../user/screen/thikadar/thikadar_screen.dart';

class HomeThikadar extends StatelessWidget {
  const HomeThikadar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: const TabBarView(
          children: [
            HomeScreen(),
            ThikadarScreen(),
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
                text: 'Thikadar',
                icon: Icon(Icons.person),
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
