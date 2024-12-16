import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_profile_app/features/crypto_app/presentation/state/bottomnavstate.dart';
// Import the state

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 100),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(80),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: const Center(
        child: NavigationBar(),
      ),
    );
  }
}

class NavigationBar extends StatelessWidget {
  const NavigationBar({super.key});

  final List<({IconData icon, String label})> items = const [
    (icon: Icons.home_outlined, label: "Home"),
    (icon: Icons.wallet_outlined, label: "Wallet"),
    (icon: Icons.person_outline, label: "Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final selectedItem = ref.watch(selectedProvider);

        return Container(
          width: 300,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.all(4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: items
                .asMap()
                .entries
                .map((item) => _buildIconButton(
                      icon: item.value.icon,
                      isPressed: item.key == selectedItem,
                      label: item.value.label,
                      onPressed: () {
                        ref.read(selectedProvider.notifier).state = item.key;
                      },
                    ))
                .toList(),
          ),
        );
      },
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required bool isPressed,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isPressed ? Colors.white : Colors.transparent,
          ),
          child: IconButton(
            icon: Icon(icon, color: isPressed ? Colors.black : Colors.white),
            onPressed: onPressed,
          ),
        ),
        if (isPressed)
          Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
      ],
    );
  }
}
