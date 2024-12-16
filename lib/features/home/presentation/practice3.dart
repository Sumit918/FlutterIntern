import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_first_app/features/home/domain/podcast_model.dart';

class Challenge3 extends StatelessWidget {
  const Challenge3({
    super.key,
    required this.creator,
  });

  final Creator creator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40.0, top: 40.0),
              child: Container(
                width: 150,
                height: 150,
                child: Image.network(
                  creator.coverPhoto,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          creator.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${creator.noOfPodcasts} podcasts • ${creator.followersNum ?? 0} followers",
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                creator.description,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 25,
                    width: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Color.fromARGB(255, 67, 65, 65),
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(10),
                        right: Radius.circular(10),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Follow",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      buildButton(
                        bgcolor: const Color.fromARGB(255, 67, 65, 65),
                        icon: Icons.share,
                        iconColor: Colors.white,
                      ),
                      buildButton(
                        bgcolor: const Color.fromARGB(255, 67, 65, 65),
                        icon: Icons.shuffle,
                        iconColor: Colors.white,
                      ),
                      buildButton(
                        bgcolor: const Color.fromARGB(255, 67, 65, 65),
                        icon: Icons.play_arrow,
                        iconColor: Colors.white,
                      ),
                      //const PlayPauseButton(size: 22),
                    ],
                  ),
                ],
              ),
            ),
            if (creator.noOfPodcasts > 0)
              for (int i = 0; i < creator.podcasts.length; i++)
                DetailItem(
                  title: creator.podcasts[i].title,
                  date: creator.podcasts[i].releaseDate,
                  duration: creator.podcasts[i].runtime.inMinutes,
                  iconColor: Colors.white,
                  iconbg: Colors.orange,
                )
            else
              const Center(
                child: Text(
                  "There are no podcasts.",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            const SizedBox(height: 60),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildIconButton(
              icon: Icons.home,
              label: 'Home',
              onPressed: () {},
            ),
            _buildIconButton(
              icon: Icons.search,
              label: 'Search',
              onPressed: () {},
            ),
            _buildIconButton(
              icon: Icons.block,
              label: 'BlockQ',
              onPressed: () {},
            ),
            _buildIconButton(
              icon: Icons.favorite,
              label: 'Favorites',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(icon, color: Colors.white),
            onPressed: onPressed,
          ),
          Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget buildButton({
    required Color bgcolor,
    required IconData icon,
    required Color iconColor,
    double iconSize = 20,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgcolor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}

class PlayPauseButton extends StatefulWidget {
  final double size;
  const PlayPauseButton({super.key, this.size = 50});

  @override
  _PlayPauseButtonState createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton> {
  bool isPlaying = false;

  void togglePlayPause() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: togglePlayPause,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.orange,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
          color: Colors.white,
          size: widget.size,
        ),
      ),
    );
  }
}

class DetailItem extends StatelessWidget {
  const DetailItem({
    super.key,
    required this.title,
    required this.date,
    required this.duration,
    required this.iconColor,
    required this.iconbg,
  });

  final String title;
  final DateTime date;
  final int duration;
  final Color iconColor;
  final Color iconbg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              PlayPauseButton(size: 15),
              const SizedBox(width: 10),
              Text(
                DateFormat('MMM d, y').format(date),
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                "$duration min",
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              const Icon(Icons.more_vert, color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }
}
