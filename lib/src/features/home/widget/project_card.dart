import 'package:flutter/material.dart';
import 'package:municipality/src/theme/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String area;
  final String status;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.area,
    required this.status,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  Future<void> _showDeleteConfirmationDialog(String project) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Project'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Are you sure you want to delete $project'),
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

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      color: color3,
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            20.heightBox,
            widget.title.text.size(22).bold.white.make(),
            const Divider(),
            widget.description.text.size(16).semiBold.white.make(),
            const SizedBox(height: 8.0),
            widget.area.text
                .size(16)
                .semiBold
                .color(Colors.white54)
                .ellipsis
                .make()
                .expand(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.status.text
                    .size(16)
                    .semiBold
                    .color(Colors.white60)
                    .ellipsis
                    .make(),
                10.widthBox,
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.status == 'Ongoing'
                        ? Colors.green
                        : widget.status == 'Planned'
                            ? Colors.yellow
                            : Colors.red,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _showDeleteConfirmationDialog(widget.title),
                ),
              ],
            ).expand(),
          ],
        ),
      ),
    );
  }
}
