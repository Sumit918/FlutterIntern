import 'package:my_profile_app/features/pc_profile/domain/user_model.dart';

class UserProfileController {
  static UserProfile getUserProfile() {
    return UserProfile(
      userName: 'nancy',
      userDevice: 'Macbook Pro 2014',
      userRole: 'UI/UX Designer',
      userImageUrl:
          'https://images.squarespace-cdn.com/content/v1/598d11586a49637f69ce0aa3/1586126792415-HL4WMVX0MMLA2ZOYVJP0/SSCoverArtTAG1400x1400.jpg?format=1500w',
      currentProjects: '5',
      hoursWorked: '80',
      upgradeStage: '5',
      upgradesCost: '923',
    );
  }
}
