import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:otakuverse/provider/anime_provider.dart'; // Import your AnimeProvider class
import 'package:otakuverse/data/models/manga.dart'; // Import your Anime model class
import 'package:otakuverse/presentation/widgets/manga_card.dart';
import 'manga_details_screen.dart';

class MangaDemo {
  final String name;
  final String imageUrl;

  MangaDemo({required this.name, required this.imageUrl});
}

class MangaScreen extends StatelessWidget {
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
                    itemCount: _animeProvider.upcomingMangaList.length,
                    itemBuilder: (context, index) {
                      return Image.network(
                        'https://images.contentstack.io/v3/assets/blt64b2de096a6f4663/blt764d4a0f5e47474c/644053fc793eef21c330beac/popular_manga.png',
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
                          hintText: 'MANGA...',
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
                        itemCount: _animeProvider.upcomingMangaList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 150,
                            color: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width ,
                                  child: Center(
                                    child: Text(
                                      _animeProvider.upcomingMangaList[index].title,
                                      style: TextStyle(fontSize: 20, color: Colors.white),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Container(width: 100,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white, // Border color
                                      width: 2, // Border width
                                    ),
                                  ),
                                  child: ClipRRect(
                                    child: Image.network(
                                      _animeProvider.upcomingMangaList[index].posterUrl,
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
                  'Trending Now',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: _buildMangaSlider(_animeProvider.newlyReleasedMangaList),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'Popular Manga',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final manga = _animeProvider.popularMangaList[index];
                  return MangaCard(
                    manga: manga,
                    isRectangular: true,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MangaDetailsScreen(manga:manga),
                        ),
                      );
                    },
                  );
                },
                childCount: _animeProvider.popularMangaList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildMangaSlider(List<Manga> animeList) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: animeList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: MangaCard(
              manga: animeList[index],
              isRectangular: false, // Use rectangular cards for slider
              onPressed: () {
                // Implement the onPressed action for the AnimeCard here
                // For example, navigate to anime details screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MangaDetailsScreen(manga: animeList[index]),
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
