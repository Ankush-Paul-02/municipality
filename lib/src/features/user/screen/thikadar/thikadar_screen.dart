import 'package:flutter/material.dart';
import 'package:municipality/src/features/user/screen/supervisor/supervisor_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../theme/colors.dart';

class ThikadarScreen extends StatefulWidget {
  const ThikadarScreen({super.key});

  @override
  State<ThikadarScreen> createState() => _ThikadarScreenState();
}

class _ThikadarScreenState extends State<ThikadarScreen> {
  final List<Project> projectsForApproval = [
    Project(
      name: 'Task 1',
      imageUrl:
          'https://images.unsplash.com/photo-1614058427323-4959d1ddfe0b?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cm9hZCUyMHdvcmt8ZW58MHx8MHx8fDA%3D',
    ),
    Project(
      name: 'Task 2',
      imageUrl:
          'https://images.unsplash.com/photo-1605600659908-0ef719419d41?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8d2FzdGV8ZW58MHx8MHx8fDA%3D',
    ),
    Project(
      name: 'Task 3',
      imageUrl:
          'https://images.unsplash.com/photo-1495556650867-99590cea3657?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHdhc3RlfGVufDB8fDB8fHww',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color4,
      appBar: AppBar(
        backgroundColor: color4,
        title: 'Thikadar Screen'.text.size(32).bold.make().centered(),
        toolbarHeight: 120,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              child: 'Thikadar Details'.text.bold.white.size(26).make(),
            ),
            20.heightBox,
            Row(
              children: [
                const CircleAvatar(
                  radius: 65,
                  backgroundImage: NetworkImage(
                    'https://plus.unsplash.com/premium_photo-1682724602143-a77d75d273b1?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww',
                  ),
                ),
                20.widthBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    'Anubhab Singh'.text.size(22).color(color1).bold.make(),
                    'Aadhar no: 7609 XXXX XXXX'
                        .text
                        .size(16)
                        .color(color2)
                        .semiBold
                        .make(),
                    'Phone no: +91 6909XXXXXX'
                        .text
                        .size(16)
                        .color(color2)
                        .semiBold
                        .make(),
                    'Pan no: XYZABFHIEHS'
                        .text
                        .size(16)
                        .color(color2)
                        .semiBold
                        .make(),
                    'Address: ABC Road, Kolkata'
                        .text
                        .size(16)
                        .color(color2)
                        .semiBold
                        .make(),
                  ],
                )
              ],
            ).pSymmetric(h: 20),
            30.heightBox,
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
              child: 'Completed Tasks'.text.bold.white.size(26).make(),
            ),
            20.heightBox,
            Container(
              padding: const EdgeInsets.only(left: 20),
              height: 160,
              child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: color3,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        'Task ${index + 1}'.text.size(20).white.bold.make(),
                        5.heightBox,
                        'Date: XX/YY/ZZ'.text.size(18).white.semiBold.make(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            'Status'.text.size(18).white.semiBold.make(),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ).pOnly(right: 20);
                },
              ),
            ),
            30.heightBox,
            _buildSectionWithIcon(
              'Pending Tasks',
              projectsForApproval,
              Icons.check_circle,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionWithIcon(
    String title,
    List<Project> projects,
    IconData icon,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 80.w,
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
          child: Row(
            children: [
              title.text.bold.white.size(24).make(),
              const Spacer(),
              Icon(icon, color: Colors.white),
            ],
          ),
        ),
        20.heightBox,
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemCount: projects.length,
          itemBuilder: (context, index) {
            return ProjectCardWithIcon(
              project: projects[index],
              icon: icon,
            );
          },
        ).pSymmetric(h: 20),
      ],
    );
  }
}

class ProjectCardWithIcon extends StatelessWidget {
  final Project project;
  final IconData icon;

  const ProjectCardWithIcon(
      {super.key, required this.project, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: color3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image(
              image: NetworkImage(project.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      project.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    
                    Icon(icon, color: Colors.white).onTap(
                      () => showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Task Accept'),
                          content: const Text(
                            'Do you want to get this task?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Yes'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('No'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                10.heightBox,
                'Address: xyz road, India'.text.semiBold.white.make(),
                'Pin code : 799004'.text.semiBold.white.make(),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
