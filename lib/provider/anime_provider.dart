import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otakuverse/data/models/anime.dart';
import 'package:otakuverse/data/models/manga.dart';
import 'package:otakuverse/data/services/anime_service.dart';

class AnimeProvider extends ChangeNotifier{

  List<Manga> _newlyReleasedMangaList = [];
  List<Manga> get newlyReleasedMangaList => _newlyReleasedMangaList;

  List<Anime> _newlyReleasedAnimeList = [];
  List<Anime> get newlyReleasedAnimeList => _newlyReleasedAnimeList;

  List<Anime> _popularAnimeList = [];
  List<Anime> get popularAnimeList => _popularAnimeList;

  List<Anime> _upcomingAnimeList = [];
  List<Anime> get upcomingAnimeList => _upcomingAnimeList;

  bool _isloadingAnime=false;
  bool get isloadingAnime=>_isloadingAnime;
  bool _isloadingManga=false;
  bool get isloadingManga=>_isloadingManga;
  bool _isloadingPop=false;
  bool get isloadingpop=>_isloadingPop;

  final AnimeService animeService = AnimeService();

  void getNewReleaseAnime(){
    _isloadingAnime=true;
    Timer(Duration(seconds: 3), () {
      animeService.fetchRecentlyUpdatedAnimes().then((animes) {
        _newlyReleasedAnimeList = animes ?? []; // Update with fetched data

        _isloadingAnime = false;
        notifyListeners();
    });
    });
  }
  void getUpcomingAnime(){
    //_isloadingAnime=true;
  //  Timer(Duration(seconds: 3), () {
      animeService.fetchUpcomingAnimes().then((animes) {
        _upcomingAnimeList = animes ?? []; // Update with fetched data
        print(_upcomingAnimeList.length);
      //  _isloadingAnime = false;
        notifyListeners();
      });
    //});
  }
  void getNewReleaseManga(){
    _isloadingManga=true;
    Timer(Duration(seconds: 3), () {
      _newlyReleasedMangaList=newlyReleasedMangaListDB;
      _isloadingManga=false;
      notifyListeners();
    });


  }
  void getPopularAnime(){
    _isloadingPop=true;
    Timer(Duration(seconds: 3), () {
      animeService.fetchPopularAnimes().then((animes) {
        _popularAnimeList = animes ?? []; // Update with fetched data

        _isloadingPop = false;
        notifyListeners();
      });
    });


  }

}