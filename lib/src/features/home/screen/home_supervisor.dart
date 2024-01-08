import 'package:flutter/material.dart';
import 'package:municipality/src/features/home/screen/home_screen.dart';

import '../../user/screen/supervisor/supervisor_screen.dart';

class HomeSupervisor extends StatelessWidget {
  const HomeSupervisor({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
       backgroundColor: Colors.black54,
        body: const TabBarView(
          children: [
            HomeScreen(),
            SupervisorScreen(),
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
                text: 'Supervisor',
                icon: Icon(Icons.supervised_user_circle),
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
