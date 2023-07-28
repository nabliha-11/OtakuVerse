import 'package:flutter/material.dart';
import '../../data/models/anime.dart';

class WatchScreen extends StatelessWidget {
  final Anime anime;

  WatchScreen({required this.anime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: Stack(
              children: [
                // Replace this with the anime cover image URL
                Image.network(
                  anime.posterUrl, // Use the anime's cover image URL from the 'anime' object
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: FloatingActionButton(
                    onPressed: () {
                      // Implement play button functionality here
                    },
                    child: Icon(Icons.play_arrow),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Watched 83 out of 100',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          // Implement add to library button functionality here
                        },
                        child: Text('Add to Library'),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      // Implement favorite button functionality here
                    },
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.grey, // Change the color when it's favorited
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Episodes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                // Replace the following dummy episode details with your actual episode data from the API
                final episodeNumber = index + 1;
                final episodeName = 'Episode $episodeNumber';
                final episodeDescription =
                    'Description of Episode $episodeNumber';
                final episodeImageUrl =
                    'https://via.placeholder.com/100'; // Replace with episode image URL

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Card(
                    child: ListTile(
                      leading: Stack(
                        children: [
                          // Replace this with the episode image URL
                          Image.network(
                            episodeImageUrl,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: FloatingActionButton(
                                onPressed: () {
                                  // Implement play episode functionality here
                                },
                                child: Icon(Icons.play_arrow),
                                mini: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                      title: Text(episodeName),
                      subtitle: Text(episodeDescription),
                    ),
                  ),
                );
              },
              childCount: 10, // Replace with the total number of episodes
            ),
          ),
        ],
      ),
    );
  }
}
