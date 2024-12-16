import 'package:my_profile_app/features/crypto_app/domain/assetmodel.dart';
import 'package:my_profile_app/features/crypto_app/domain/recentusermodel.dart';

class CryptoProfile {
  final String name;
  final double balance;
  final double balanceChange;
  final List<RecentUser> recentUsers;
  final List<Asset> assets;

  CryptoProfile({
    required this.name,
    required this.balance,
    required this.balanceChange,
    required this.recentUsers,
    required this.assets,
  });
}
