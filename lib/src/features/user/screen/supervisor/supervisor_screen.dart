import 'package:flutter/material.dart';
import 'package:municipality/src/theme/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class SupervisorScreen extends StatefulWidget {
  const SupervisorScreen({super.key});

  @override
  State<SupervisorScreen> createState() => _SupervisorScreenState();
}

class _SupervisorScreenState extends State<SupervisorScreen> {
  final List<Project> upcomingProjects = [
    Project(
      name: 'Project 1',
      imageUrl:
          'https://images.unsplash.com/photo-1620325867502-221cfb5faa5f?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvamVjdHN8ZW58MHx8MHx8fDA%3D',
    ),
    Project(
      name: 'Project 2',
      imageUrl:
          'https://images.unsplash.com/photo-1531403009284-440f080d1e12?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvamVjdHN8ZW58MHx8MHx8fDA%3D',
    ),
    Project(
      name: 'Project 3',
      imageUrl:
          'https://images.unsplash.com/photo-1620136909038-f9ceab618ad1?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8bXVuaWNpcGFsaXR5fGVufDB8fDB8fHww',
    ),
  ];

  final List<Project> projectsForApproval = [
    Project(
      name: 'Project 4',
      imageUrl:
          'https://images.unsplash.com/photo-1620136908334-50793b779b63?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8bXVuaWNpcGFsaXR5fGVufDB8fDB8fHww',
    ),
    Project(
      name: 'Project 5',
      imageUrl:
          'https://images.unsplash.com/photo-1598903621926-9623800a4c2d?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fG11bmljaXBhbGl0eXxlbnwwfHwwfHx8MA%3D%3D',
    ),
    Project(
      name: 'Project 6',
      imageUrl:
          'https://images.unsplash.com/photo-1494854597826-36acda2f8548?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjJ8fG11bmljaXBhbGl0eXxlbnwwfHwwfHx8MA%3D%3D',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color4,
      appBar: AppBar(
        backgroundColor: color4,
        title: 'Supervisor Screen'.text.size(32).bold.make().centered(),
        toolbarHeight: 120,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              'Upcoming Projects',
              upcomingProjects,
            ),
            30.heightBox,
            _buildSectionWithIcon(
              'Projects for Approval',
              projectsForApproval,
              Icons.check_circle,
            ),
            30.heightBox,
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Project> projects) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 70.w,
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
          child: title.text.bold.white.size(24).make(),
        ),
        20.heightBox,
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemCount: projects.length,
          itemBuilder: (context, index) {
            return ProjectCard(project: projects[index]);
          },
        ).pSymmetric(h: 20),
      ],
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

class Project {
  final String name;
  final String imageUrl;

  Project({required this.name, required this.imageUrl});
}

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

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
            child: Text(
              project.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
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
            child: Row(
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
                      title: const Text('Project Approval'),
                      content: const Text(
                        'Do you want to approve this project?',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Approve'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
