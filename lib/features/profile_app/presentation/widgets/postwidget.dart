import 'package:flutter/material.dart';
import 'package:my_profile_app/features/profile_app/domain/post_model.dart';

class PostWidget extends StatelessWidget {
  final List<Post> posts;

  const PostWidget({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return _buildPost(post);
      },
    );
  }

  Widget _buildPost(Post post) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1.0),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Stack(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(post.authorAvatarUrl),
                ),
              ],
            ),
            title: Text(post.authorName),
            subtitle: Text('${post.authorUsername} · ${post.timeAgo}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(post.content),
          ),
          if (post.postImageUrl.isNotEmpty) Image.network(post.postImageUrl),
        ],
      ),
    );
  }
}
