import 'package:my_profile_app/features/crypto_app/domain/recentusermodel.dart';

class RecentUserController {
  static List<RecentUser> getRecentUsers() {
    return [
      RecentUser(
        name: 'Jane',
        imageUrl:
            'https://images.squarespace-cdn.com/content/v1/598d11586a49637f69ce0aa3/1586126792415-HL4WMVX0MMLA2ZOYVJP0/SSCoverArtTAG1400x1400.jpg?format=1500w',
      ),
      RecentUser(
        name: 'Cameron',
        imageUrl:
            'https://images.squarespace-cdn.com/content/v1/598d11586a49637f69ce0aa3/1586126792415-HL4WMVX0MMLA2ZOYVJP0/SSCoverArtTAG1400x1400.jpg?format=1500w',
      ),
      RecentUser(
        name: 'David',
        imageUrl:
            'https://images.squarespace-cdn.com/content/v1/598d11586a49637f69ce0aa3/1586126792415-HL4WMVX0MMLA2ZOYVJP0/SSCoverArtTAG1400x1400.jpg?format=1500w',
      ),
      RecentUser(
        name: 'Robert',
        imageUrl:
            'https://images.squarespace-cdn.com/content/v1/598d11586a49637f69ce0aa3/1586126792415-HL4WMVX0MMLA2ZOYVJP0/SSCoverArtTAG1400x1400.jpg?format=1500w',
      ),
    ];
  }
}
