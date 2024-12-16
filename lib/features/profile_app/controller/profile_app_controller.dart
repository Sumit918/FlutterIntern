import 'package:my_profile_app/features/profile_app/domain/post_model.dart';
import 'package:my_profile_app/features/profile_app/domain/profile_model.dart';

class ProfileAppController {
  static Profile getProfile() {
    return Profile(
      name: 'Darlene Beats',
      username: 'dw_beats',
      profileImageUrl:
          'https://images.squarespace-cdn.com/content/v1/598d11586a49637f69ce0aa3/1586126792415-HL4WMVX0MMLA2ZOYVJP0/SSCoverArtTAG1400x1400.jpg?format=1500w',
      posts: 30,
      followers: 120000,
      following: 1030,
      storyThumbnails: [
        'https://images.squarespace-cdn.com/content/v1/598d11586a49637f69ce0aa3/1586126792415-HL4WMVX0MMLA2ZOYVJP0/SSCoverArtTAG1400x1400.jpg?format=1500w',
        'https://images.squarespace-cdn.com/content/v1/598d11586a49637f69ce0aa3/1586126792415-HL4WMVX0MMLA2ZOYVJP0/SSCoverArtTAG1400x1400.jpg?format=1500w',
        'https://images.squarespace-cdn.com/content/v1/598d11586a49637f69ce0aa3/1586126792415-HL4WMVX0MMLA2ZOYVJP0/SSCoverArtTAG1400x1400.jpg?format=1500w',
        'https://images.squarespace-cdn.com/content/v1/598d11586a49637f69ce0aa3/1586126792415-HL4WMVX0MMLA2ZOYVJP0/SSCoverArtTAG1400x1400.jpg?format=1500w',
      ],
    );
  }

  static List<Post> getPosts() {
    return [
      Post(
        authorName: 'Nilesh',
        authorUsername: '@nilesh',
        authorAvatarUrl:
            'https://images.squarespace-cdn.com/content/v1/598d11586a49637f69ce0aa3/1586126792415-HL4WMVX0MMLA2ZOYVJP0/SSCoverArtTAG1400x1400.jpg?format=1500w',
        content:
            'Discover adventure in Patagonia\'s peaks or serenity Provence\'s.',
        timeAgo: '1h ago',
        postImageUrl:
            'https://images.squarespace-cdn.com/content/v1/598d11586a49637f69ce0aa3/1586126792415-HL4WMVX0MMLA2ZOYVJP0/SSCoverArtTAG1400x1400.jpg?format=1500w',
      ),
      Post(
        authorName: 'Sophie',
        authorUsername: '@sophie',
        authorAvatarUrl:
            'https://images.squarespace-cdn.com/content/v1/598d11586a49637f69ce0aa3/1586126792415-HL4WMVX0MMLA2ZOYVJP0/SSCoverArtTAG1400x1400.jpg?format=1500w',
        content: 'Enjoy the beauty of the mountains!',
        timeAgo: '2h ago',
        postImageUrl:
            'https://images.squarespace-cdn.com/content/v1/598d11586a49637f69ce0aa3/1586126792415-HL4WMVX0MMLA2ZOYVJP0/SSCoverArtTAG1400x1400.jpg?format=1500w',
      ),
    ];
  }
}
