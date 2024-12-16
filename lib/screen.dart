import 'package:flutter/material.dart';
import 'package:my_first_app/columnPractice/presentation/column_row.dart';
import 'package:my_first_app/features/home/domain/podcast_model.dart';
import 'package:my_first_app/practice/presentation/practice.dart';
import 'package:my_first_app/features/home/presentation/home.dart';
import 'package:my_first_app/practice/presentation/practice2.dart';
import 'package:my_first_app/features/home/presentation/practice3.dart';

class Screens extends StatelessWidget {
  const Screens({super.key});

  Widget buildItem(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Widget widget,
    required int number,
  }) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.amber,
        ),
        child: Icon(icon),
      ),
      trailing: Text(number.toString()),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: const Text("Flutter"),
              subtitle: const Text("Exercise for containers"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Homescreen(),
                ),
              ),
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber,
                ),
                child: const FlutterLogo(),
              ),
              trailing: const Text("1"),
            ),
            buildItem(
              context,
              title: "Column and Row",
              subtitle: "Practice column and row",
              icon: Icons.add,
              widget: const Challenge(),
              number: 2,
            ),
            buildItem(
              context,
              title: "Column and Row with ListTile",
              subtitle: "Practice column and row with ListTile",
              icon: Icons.add,
              widget: const Challenge1(),
              number: 3,
            ),
            buildItem(
              context,
              title: "GUI",
              subtitle: "Practice column and row",
              icon: Icons.add,
              widget: const Challenge2(),
              number: 4,
            ),
            buildItem(
              context,
              title: "GUI 2",
              subtitle: "Practice column and row",
              icon: Icons.add,
              widget: Challenge3(
                creator: Creator(
                  name: "Mucho Sucess",
                  coverPhoto:
                      "https://images.squarespace-cdn.com/content/v1/598d11586a49637f69ce0aa3/1586126792415-HL4WMVX0MMLA2ZOYVJP0/SSCoverArtTAG1400x1400.jpg?format=1500w",
                  description:
                      "Bricia Lopez is the co-proprietor of Guelaguetza, the Oaxacan-style restaurant opened by her parents and now owned by Bricia and her siblings, as well as the co-host of the Super Mamás Podcast which connects and empowers women through their mamáhood journey.",
                  podcasts: [
                    Podcast(
                      title: "Podcast Title ",
                      releaseDate: DateTime.now(),
                      runtime: const Duration(minutes: 30),
                      link: "https://google.com",
                    ),
                    Podcast(
                      title: "Podcast Title 2 ",
                      releaseDate: DateTime.now(),
                      runtime: const Duration(minutes: 30),
                      link: "https://google.com",
                    ),
                  ],
                ),
              ),
              number: 5,
            ),
          ],
        ),
      ),
    );
  }
}
