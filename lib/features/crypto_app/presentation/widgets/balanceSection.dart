import 'package:flutter/material.dart';
import 'package:my_profile_app/features/crypto_app/domain/cryptoprofile.dart';
import 'package:my_profile_app/features/crypto_app/presentation/widgets/actionButtons.dart';
import 'dart:math';

class BalanceSection extends StatelessWidget {
  final CryptoProfile cryptoProfile;
  const BalanceSection({
    super.key,
    required this.cryptoProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 50,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      child: Column(
        // Removed const here
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Text(
              'Your balance · USD',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${cryptoProfile.balance.toString()}',
                  style: const TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  '+\$${cryptoProfile.balanceChange.toString()}',
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 228, 228, 228),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 80),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ActionButton(
                label: 'Send',
                icon: Icons.arrow_upward,
                color: Colors.yellow,
                rotationAngle: 45 * pi / 180,
              ),
              ActionButton(
                label: 'Receive',
                icon: Icons.arrow_downward,
                color: Colors.yellow,
                rotationAngle: 45 * pi / 180,
              ),
              ActionButton(
                label: 'Add Funds',
                icon: Icons.add,
                color: Colors.white,
                rotationAngle: 0,
              ),
            ],
          )
        ],
      ),
    );
  }
}
