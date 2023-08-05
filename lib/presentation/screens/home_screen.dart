import 'package:flutter/material.dart';
import 'package:otakuverse/provider/anime_provider.dart';
import '../../data/models/anime.dart';
import '../../data/repositories/anime_repository.dart';
import '../widgets/anime_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'anime_details_screen.dart';
import 'anime_screen.dart';
import 'manga_details_screen.dart';
import 'manga_screen.dart';
import 'package:provider/provider.dart';
import '../../data/models/manga.dart';
import '../widgets/manga_card.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    // _loadDummyData();
    final provider= Provider.of<AnimeProvider>(context,listen: false);
    provider.getNewReleaseAnime();
    provider.getNewReleaseManga();
    provider.getPopularAnime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OtakuVerse'),
      ),
      body: Consumer<AnimeProvider>(
        builder: (context, _animeProvider, _) {
          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    // Rectangular cards for Anime and Manga
                    _buildTopSection(),

                    // Newly Released Anime Section
                    _buildSectionHeader('Continue Watching...'),
                    _animeProvider.isloadingAnime == false
                        ? _buildAnimeSlider(_animeProvider.newlyReleasedAnimeList)
                        : Center(child: const CircularProgressIndicator()),

                    // Newly Released Manga Section
                    _buildSectionHeader('Continue Reading...'),
                    _animeProvider.isloadingManga == false
                        ? _buildMangaSlider(_animeProvider.newlyReleasedMangaList)
                        : Center(child: const CircularProgressIndicator()),

                    // Popular Anime List Section
                    _buildSectionHeader('Recommended'),
                    _animeProvider.isloadingManga == false
                        ? Column(
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: _animeProvider.popularAnimeList
                          .map((anime) => AnimeCard(
                        anime: anime,
                        isRectangular: true,
                        onPressed: () {
                          // Add your onPressed function logic here
                          // For example, you can navigate to the anime details screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AnimeDetailsScreen(anime: anime),
                            ),
                          );
                        },
                      ))
                          .toList(),
                    )
                        : Center(child: const CircularProgressIndicator()),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTopSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded( // Wrap the first card in Expanded
            child: _buildTopCard('Anime', 'https://qph.cf2.quoracdn.net/main-qimg-ac8ecd37b13b79d6d347822254041c5d-lq'),
          ),
          Expanded( // Wrap the second card in Expanded
            child: _buildTopCard('Manga', 'https://gobookmart.com/wp-content/uploads/2022/06/Top-10-Manga-of-All-Time-10-Best-Manga-1200x900.jpg'),
          ),
        ],
      ),
    );
  }


  Widget _buildTopCard(String title, String imageUrl) {
    return GestureDetector(
      onTap: () {
        if(title=='Anime')
           _openAnimeScreen(context);
        else if(title=='Manga')
          _openMangaScreen(context);
        },
      child: Card(
        color: Colors.deepPurple,
        //shadowColor:Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: 100,
              width: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 20.sp, fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildMangaSlider(List<Manga> mangaList) {

    return Container(
      height: 200.h,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mangaList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: MangaCard(manga: mangaList[index], onPressed: () {
                _openMangaDetailsScreen(context,mangaList[index]);
            }),
          );
        },
      ),
    );
  }
  Widget _buildAnimeSlider(List<Anime> animeList) {

    return Container(
      height: 200.h,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: animeList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: AnimeCard(anime: animeList[index], onPressed: () {
              _openAnimeDetailsScreen(context,animeList[index]);
            }),
          );
        },
      ),
    );
  }

  void _openAnimeDetailsScreen(BuildContext context, Anime anime) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AnimeDetailsScreen(anime: anime),
      ),
    );
  }
  void _openMangaDetailsScreen(BuildContext context, Manga manga) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MangaDetailsScreen(manga: manga),
      ),
    );
  }
  void _openAnimeScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AnimeScreen(),
      ),
    );
  }
  void _openMangaScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MangaScreen(),
      ),
    );
  }
}


//model based ui---dynamically