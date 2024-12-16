import 'package:my_profile_app/features/crypto_app/controller/assetcontroller.dart';
import 'package:my_profile_app/features/crypto_app/controller/recentusercontroller.dart';
import 'package:my_profile_app/features/crypto_app/domain/cryptoprofile.dart';

class CryptoProfileController {
  static CryptoProfile getCryptoProfile() {
    return CryptoProfile(
      name: 'Kathryn',
      balance: 9183.12,
      balanceChange: 533.80,
      recentUsers: RecentUserController.getRecentUsers(), // Fetch recent users
      assets: AssetController.getAssets(), // Fetch assets
    );
  }
}
