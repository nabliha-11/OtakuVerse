import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:otakuverse/provider/anime_provider.dart'; // Import your AnimeProvider class
import 'package:otakuverse/data/models/anime.dart'; // Import your Anime model class
import 'package:otakuverse/presentation/widgets/anime_card.dart';
import 'anime_details_screen.dart';


class AnimeDemo {
  final String name;
  final String imageUrl;

  AnimeDemo({required this.name, required this.imageUrl});
}

class AnimeScreen extends StatelessWidget {
  final List<AnimeDemo> demoAnimeList = [
    AnimeDemo(
      name: 'Anime 1',
      imageUrl: 'https://via.placeholder.com/600x400/FF0000/FFFFFF',
    ),
    AnimeDemo(
      name: 'Anime 2',
      imageUrl: 'https://via.placeholder.com/600x400/00FF00/000000',
    ),
    AnimeDemo(
      name: 'Anime 3',
      imageUrl: 'https://via.placeholder.com/600x400/0000FF/FFFFFF',
    ),
    // Add more demo anime data here
  ];
  @override
  Widget build(BuildContext context) {
    final _animeProvider = Provider.of<AnimeProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              expandedHeight: 300,
              flexibleSpace: Stack(
                children: [
                  // Blurry Background for Top Section
                  PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _animeProvider.upcomingAnimeList.length,
                    itemBuilder: (context, index) {
                      return Image.network(
                        'https://wallpaper.dog/large/606621.jpg',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.low,
                        color: Colors.black.withOpacity(0.5),
                        colorBlendMode: BlendMode.darken,
                      );
                    },
                  ),
                  Positioned(
                    top: 40,
                    left: 16,
                    right: 16,
                    child: Container(
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Anime',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 16,
                    right: 16,
                    child: Container(
                      height: 200,
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _animeProvider.upcomingAnimeList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 150,
                            color: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _animeProvider.upcomingAnimeList[index].title,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  width: 100,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white, // Border color
                                      width: 2, // Border width
                                    ),
                                  ),
                                  child: ClipRRect(
                                    child:Image.network(
                                      _animeProvider.upcomingAnimeList[index].posterUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              // pinned: true,
              floating: true,
              snap: true,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'Recently Updated',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: _buildAnimeSlider(_animeProvider.newlyReleasedAnimeList),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'Popular Anime',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final anime = _animeProvider.popularAnimeList[index];
                  return AnimeCard(
                    anime: anime,
                    isRectangular: true,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AnimeDetailsScreen(anime: anime),
                        ),
                      );
                    },
                  );
                },
                childCount: _animeProvider.popularAnimeList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildAnimeSlider(List<Anime> animeList) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: animeList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: AnimeCard(
              anime: animeList[index],
              isRectangular: false, // Use rectangular cards for slider
              onPressed: () {
                // Implement the onPressed action for the AnimeCard here
                // For example, navigate to anime details screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AnimeDetailsScreen(anime: animeList[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

