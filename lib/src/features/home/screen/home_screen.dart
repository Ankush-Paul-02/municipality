import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:municipality/src/auth/screens/login_screen.dart';
import 'package:municipality/src/theme/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widget/news_card.dart';
import '../widget/project_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> newsList = [
      {
        "title": "New Infrastructure Project Announced",
        "description":
            "The municipality plans to launch a new infrastructure project to enhance public facilities.",
        "area": "City Center",
        "time": "2024-01-07 10:30 AM",
      },
      {
        "title": "Health Awareness Campaign",
        "description":
            "A health awareness campaign is scheduled to promote well-being and preventive healthcare measures.",
        "area": "Various Locations",
        "time": "2024-01-06 02:00 PM",
      },
      {
        "title": "Upcoming Road Maintenance",
        "description":
            "Scheduled road maintenance will be conducted to improve the condition of major roads in the municipality.",
        "area": "Highway District",
        "time": "2024-01-05 09:45 AM",
      },
    ];

    List<Map<String, String>> projectList = [
      {
        "title": "Smart City Development",
        "description":
            "The municipality is actively working on transforming the city into a smart city with advanced technology and infrastructure.",
        "area": "Citywide",
        "status": "Ongoing",
      },
      {
        "title": "Green Park Initiative",
        "description":
            "A new park development project aims to create more green spaces within the city for recreational purposes and environmental conservation.",
        "area": "Park District",
        "status": "Upcoming",
      },
      {
        "title": "Community Center Renovation",
        "description":
            "The community center will undergo renovation to provide better facilities and services to the residents.",
        "area": "Community Zone",
        "status": "Planned",
      }
    ];

    List<Widget> newsSlides = newsList.map((news) {
      return NewsCard(
        title: news['title']!,
        description: news['description']!,
        area: news['area']!,
        time: news['time']!,
      );
    }).toList();

    List<Widget> projectSlides = projectList.map((project) {
      return ProjectCard(
        title: project['title']!,
        description: project['description']!,
        area: project['area']!,
        status: project['status']!,
      );
    }).toList();

    return SafeArea(
      child: Scaffold(
        backgroundColor: color4,
        appBar: AppBar(
          title:
              'Municipality'.text.size(32).bold.color(color1).make().centered(),
          backgroundColor: color4,
          toolbarHeight: 120,
          elevation: 0,
        ),
        drawer: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  color: color2,
                ),
                accountName: 'username'.text.white.semiBold.size(20).make(),
                accountEmail:
                    'user@gmail.com'.text.white.semiBold.size(20).make(),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1640951613773-54706e06851d?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fG11bmljaXBhbHR5JTIwdXNlcnxlbnwwfHwwfHx8MA%3D%3D',
                  ),
                ),
                currentAccountPictureSize: const Size.square(70),
              ),
              ListTile(
                title: 'Profile'.text.black.semiBold.make(),
                leading: const Icon(Icons.person, color: color3, size: 32),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                title: 'Logout'.text.black.semiBold.make(),
                leading: const Icon(Icons.logout, color: color3, size: 32),
                onTap: () => Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              'Kolkata\nMunicipality Corporation'
                  .text
                  .size(26)
                  .color(color1)
                  .bold
                  .make()
                  .pSymmetric(h: 20),
              20.heightBox,
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/municipality.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ).pSymmetric(h: 20),
              30.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50.w,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    decoration: const BoxDecoration(
                      color: color1,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: 'Top News'.text.bold.white.size(26).make(),
                  ),
                  'See all'
                      .text
                      .normal
                      .size(18)
                      .color(Colors.red)
                      .semiBold
                      .make()
                      .pSymmetric(h: 20),
                ],
              ),
              20.heightBox,
              //! News
              CarouselSlider(
                items: newsSlides,
                options: CarouselOptions(
                  height: 300,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  onPageChanged: (index, reason) {},
                  scrollDirection: Axis.horizontal,
                ),
              ),
              30.heightBox,
              Container(
                width: 50.w,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                decoration: const BoxDecoration(
                  color: color1,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: 'Top Projects'.text.bold.white.size(26).make(),
              ),
              20.heightBox,
              //! Projects
              CarouselSlider(
                items: projectSlides,
                options: CarouselOptions(
                  height: 300,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  onPageChanged: (index, reason) {},
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
