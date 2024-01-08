import 'package:flutter/material.dart';
import 'package:municipality/src/features/home/screen/home_screen.dart';
import 'package:municipality/src/features/user/screen/user/user_screen.dart';

class HomeUser extends StatelessWidget {
  const HomeUser({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
       backgroundColor: Colors.black54,
        body: const TabBarView(
          children: [
            HomeScreen(),
            UserScreen(),
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
                text: 'User',
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
