import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:otakuverse/presentation/screens/watch_screen.dart';
import '../../data/models/anime.dart';
import 'package:expandable/expandable.dart';
class AnimeDetailsScreen extends StatelessWidget {
  final Anime anime;

  AnimeDetailsScreen({required this.anime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: Stack(
              children: [
                Image.network(
                  anime.posterUrl, // Replace with anime cover image URL
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Container(
                    width: MediaQuery.of(context).size.width-32,
                    child: Text(
                      anime.title,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: Colors.yellow, size: 18),
                        SizedBox(width: 4),
                        Text(
                          //'4.6/5.0',
                          anime.rating.toString(),
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            pinned: true,
            floating: false,
            snap: false,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  ExpandableText(
                    anime.description,
                    maxLines: 3,
                    expandText: 'See more...',
                    collapseText: 'See less',
                  ),
                  SizedBox(height: 16),
                  Text(
                      //'Total Episodes: 25',
                    'Total Episodes: ${anime.episodes}',
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Producer :',
                    //'Producer: ${anime.producer}',
                    style: TextStyle(fontSize: 16),
                  ),
                  // Add more details about the anime here
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Genre',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    //children: anime.genres.map((genre) => Chip(label: Text(genre))).toList(),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Characters',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: anime.characters.length, // Replace with the number of characters you want to display
                      itemBuilder: (context, index) {
                        // Replace the following dummy character details with your actual character data from the API
                        final characterName = anime.characters[index].name;
                        final characterPhotoUrl =
                            anime.characters[index].image; // Replace with character photo URL

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(characterPhotoUrl),
                                // Replace with character photo URL
                              ),
                              SizedBox(height: 8),
                              Text(
                                characterName,
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WatchScreen(anime: anime),
            ),
          );
          // Open Watch Screen
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
