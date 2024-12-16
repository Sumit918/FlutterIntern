import 'package:flutter/material.dart';
import 'package:my_profile_app/features/pc_profile/domain/user_model.dart';

class PcStats extends StatelessWidget {
  final UserProfile userProfile;
  const PcStats({super.key, required this.userProfile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      margin: const EdgeInsets.only(
        top: 70,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: buildStatItem(
                'CURRENT', 'PROJECTS', userProfile.currentProjects ?? '0'),
          ),
          Expanded(
              child: buildStatItem(
                  'HOURS', 'WORKED', userProfile.hoursWorked ?? '0')),
          Expanded(
              child: buildStatItem(
                  'UPGRADES', 'STAGE', userProfile.upgradeStage ?? '0')),
          Expanded(
              child: buildStatItem(
                  'UPGRADES', 'COST', '\$${userProfile.upgradesCost ?? '0'}')),
        ],
      ),
    );
  }

  Widget buildStatItem(String label, String label2, String value) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            color: Colors.white70,
          ),
        ),
        Text(
          label2,
          style: const TextStyle(
            fontSize: 10,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
