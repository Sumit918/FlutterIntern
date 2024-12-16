import 'package:flutter/material.dart';
import 'package:my_profile_app/features/profile_app/domain/post_model.dart';
import 'package:my_profile_app/features/profile_app/domain/profile_model.dart';
import 'package:my_profile_app/features/profile_app/presentation/widgets/PostWidget.dart';
import 'package:my_profile_app/features/profile_app/presentation/widgets/add_story_button.dart';
import 'package:my_profile_app/features/profile_app/presentation/widgets/profile_stats.dart';
import 'package:my_profile_app/features/profile_app/presentation/widgets/profileheader.dart';
import 'package:my_profile_app/features/profile_app/presentation/widgets/story_thumbnail.dart';
import 'package:my_profile_app/features/profile_app/presentation/widgets/tab_bar_section.dart';

class ProfileApp extends StatelessWidget {
  final Profile profile;
  final List<Post> posts;

  const ProfileApp({super.key, required this.profile, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 24, 217, 231), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.2],
          ),
        ),
        child: Column(
          children: [
            // Header section with Row
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Text(
                        "Darlene",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Edit",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Profile Header and Stats
                    ProfileHeader(profile: profile),
                    ProfileStats(
                      posts: profile.posts,
                      followers: profile.followers,
                      following: profile.following,
                    ),

                    SizedBox(
                      height: 160,
                      child: ListView(
                        padding: const EdgeInsets.only(left: 15),
                        scrollDirection: Axis.horizontal,
                        children: [
                          // Ensure the Row does not overflow
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const AddStoryButton(),
                              ...profile.storyThumbnails
                                  .map((url) => StoryThumbnail(url: url)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Tab bar section
                    const TabBarSection(),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        PostWidget(posts: posts),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> learingMap() {
    List<String> list1 = [
      'A',
      'B',
      'C',
      'D',
      'E',
    ];
    List<Widget> widgets1 = [];
    for (String i in list1) {
      widgets1.add(Text(i));
    }
    return widgets1;
  }

  List<Widget> learningMap(List<String> hello) =>
      hello.map((value) => Text(value)).toList();
}
