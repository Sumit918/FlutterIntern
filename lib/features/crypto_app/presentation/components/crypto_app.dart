import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_profile_app/features/crypto_app/controller/assetcontroller.dart';
import 'package:my_profile_app/features/crypto_app/controller/cryptoprofilecontroller.dart';
import 'package:my_profile_app/features/crypto_app/controller/recentusercontroller.dart';
import 'package:my_profile_app/features/crypto_app/presentation/state/bottomnavstate.dart';
import 'package:my_profile_app/features/crypto_app/presentation/widgets/assestsSection.dart';
import 'package:my_profile_app/features/crypto_app/presentation/widgets/balanceSection.dart';
import 'package:my_profile_app/features/crypto_app/presentation/widgets/bottomNavigation.dart';
import 'package:my_profile_app/features/crypto_app/presentation/widgets/form.dart';
import 'package:my_profile_app/features/crypto_app/presentation/widgets/recentSection.dart';
import 'package:my_profile_app/features/crypto_app/presentation/widgets/userProfile.dart';
import 'package:my_profile_app/screen.dart';

class CryptoApp extends ConsumerWidget {
  const CryptoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(selectedProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          IndexedStack(
            index: currentPage,
            children: const [
              Home(),
              Screens(),
              MyForm(),
            ],
          ),
          const Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: BottomNavigation(),
          ),
        ],
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final cryptoProfile = CryptoProfileController.getCryptoProfile();
    final recentUsers = RecentUserController.getRecentUsers();
    final assets = AssetController.getAssets();

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 0, 12, 119),
                  Color.fromARGB(255, 0, 26, 255),
                  Color.fromARGB(255, 134, 144, 220),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                UserProfile(cryptoProfile: cryptoProfile),
                BalanceSection(cryptoProfile: cryptoProfile),
              ],
            ),
          ),
          const SizedBox(height: 16), // Add spacing between sections
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                RecentsSection(
                    recentUsers: recentUsers), // Pass the list of recent users
                AssetsSection(assets: assets),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
