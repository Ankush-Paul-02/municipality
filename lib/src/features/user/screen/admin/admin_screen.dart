import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:municipality/src/features/user/screen/admin/see_all.dart';
import 'package:municipality/src/theme/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../home/widget/project_card.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  List<Map<String, dynamic>> users = [
    {
      'name': 'User 1',
      'image':
          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww',
    },
    {
      'name': 'User 2',
      'image':
          'https://plus.unsplash.com/premium_photo-1682724602143-a77d75d273b1?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww',
    },
    {
      'name': 'User 3',
      'image':
          'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fHww',
    },
    {
      'name': 'User 4',
      'image':
          'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cGVyc29ufGVufDB8fDB8fHww',
    },
    {
      'name': 'User 5',
      'image':
          'https://images.unsplash.com/photo-1554151228-14d9def656e4?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8cGVyc29ufGVufDB8fDB8fHww',
    },
  ];

  Future<void> _showDeleteConfirmationDialog(String userName) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete User'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Are you sure you want to delete $userName'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _showInformationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('User Information'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.person, size: 50),
              5.heightBox,
              const Text('Name: user'),
              const Text('Email: email@gmail.com'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

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

  @override
  Widget build(BuildContext context) {
    List<Widget> projectSlides = projectList.map((project) {
      return ProjectCard(
        title: project['title']!,
        description: project['description']!,
        area: project['area']!,
        status: project['status']!,
      );
    }).toList();
    return Scaffold(
      backgroundColor: color4,
      appBar: AppBar(
        backgroundColor: color4,
        title: 'Admin Screen'.text.size(32).bold.make().centered(),
        toolbarHeight: 120,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                text: 'Good Afternoon\n',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: color1,
                ),
                children: [
                  TextSpan(
                    text: 'Admin',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: color1,
                    ),
                  ),
                ],
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
                  child: 'Users'.text.bold.white.size(26).make(),
                ),
                'See all'
                    .text
                    .normal
                    .size(18)
                    .color(Colors.red)
                    .semiBold
                    .make()
                    .onTap(
                      () => Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const AllUsersList(),
                        ),
                      ),
                    )
                    .pSymmetric(h: 20),
              ],
            ),
            20.heightBox,
            ListView.builder(
              shrinkWrap: true,
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      users[index]['image'],
                    ),
                  ),
                  title: users[index]['name']
                      .toString()
                      .text
                      .size(20)
                      .color(color1)
                      .bold
                      .make(),
                  subtitle: 'Additional Info'
                      .text
                      .size(16)
                      .color(color2)
                      .semiBold
                      .make(),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.info, color: Colors.blue),
                        onPressed: () => _showInformationDialog(context),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _showDeleteConfirmationDialog(
                            users[index]['name'].toString()),
                      ),
                    ],
                  ),
                );
              },
            ),
            30.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 60.w,
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
                  child: 'Current Projects'.text.bold.white.size(26).make(),
                ),
                'See all'
                    .text
                    .normal
                    .size(18)
                    .color(Colors.red)
                    .semiBold
                    .make()
                    .onTap(
                      () => Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const AllUsersList(),
                        ),
                      ),
                    )
                    .pSymmetric(h: 20),
              ],
            ),
            20.heightBox,
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
    );
  }
}
