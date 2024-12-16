class Profile {
  final String name;
  final String username;
  final String profileImageUrl;
  final int posts;
  final int followers;
  final int following;
  final List<String> storyThumbnails;

  Profile({
    required this.name,
    required this.username,
    required this.profileImageUrl,
    required this.posts,
    required this.followers,
    required this.following,
    required this.storyThumbnails,
  });
}
