import 'package:flutter/material.dart';
import 'package:my_profile_app/features/pc_profile/domain/system_specs_model.dart';
import 'package:my_profile_app/features/pc_profile/domain/user_model.dart';
import 'package:my_profile_app/features/pc_profile/presentation/widgets/pcstats.dart';
import 'package:my_profile_app/features/pc_profile/presentation/widgets/profileInfo.dart';
import 'package:my_profile_app/features/pc_profile/presentation/widgets/profilepicture.dart';
import 'package:my_profile_app/features/pc_profile/presentation/widgets/systemspecs.dart'; // Import the SystemSpecsWidget

class PcProfile extends StatelessWidget {
  final UserProfile userProfile;
  final SystemSpecs systemSpecs;

  const PcProfile(
      {super.key, required this.userProfile, required this.systemSpecs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Expanded(
          child: Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 41, 11, 88)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfilePicture(userProfile: userProfile),
                ProfileInfo(userProfile: userProfile),
                PcStats(userProfile: userProfile),
                SystemSpecsWidget(systemSpecs: systemSpecs),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
