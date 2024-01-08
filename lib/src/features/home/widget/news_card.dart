import 'package:flutter/material.dart';
import 'package:municipality/src/theme/colors.dart';
import 'package:velocity_x/velocity_x.dart';


class NewsCard extends StatelessWidget {
  final String title;
  final String description;
  final String area;
  final String time;

  const NewsCard({super.key, 
    required this.title,
    required this.description,
    required this.area,
    required this.time,
  });

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
            title.text.size(22).bold.white.make(),
            const Divider(),
            description.text.size(16).semiBold.white.make(),
            const SizedBox(height: 8.0),
            area.text.size(16).semiBold.color(Colors.white54).ellipsis.make().expand(),
            time.text.size(16).semiBold.color(Colors.white54).ellipsis.make().expand(),
          ],
        ),
      ),
    );
  }
}
