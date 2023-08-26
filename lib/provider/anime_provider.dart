import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otakuverse/data/models/anime.dart';
import 'package:otakuverse/data/models/manga.dart';
import 'package:otakuverse/data/services/anime_service.dart';
import 'package:otakuverse/data/services/manga_service.dart';

class AnimeProvider extends ChangeNotifier{

  List<Anime> _newlyReleasedAnimeList = [];
  List<Anime> get newlyReleasedAnimeList => _newlyReleasedAnimeList;

  List<Anime> _popularAnimeList = [];
  List<Anime> get popularAnimeList => _popularAnimeList;

  List<Anime> _upcomingAnimeList = [];
  List<Anime> get upcomingAnimeList => _upcomingAnimeList;

  List<Manga> _upcomingMangaList = [];
  List<Manga> get upcomingMangaList => _upcomingMangaList;

  List<Manga> _popularMangaList = [];
  List<Manga> get popularMangaList => _popularMangaList;

  List<Manga> _newlyReleasedMangaList = [];
  List<Manga> get newlyReleasedMangaList => _newlyReleasedMangaList;


  bool _isloadingAnime=false;
  bool get isloadingAnime=>_isloadingAnime;

  bool _isloadingManga=false;
  bool get isloadingManga=>_isloadingManga;

  bool _isloadingPop=false;
  bool get isloadingpop=>_isloadingPop;

  bool _isloadingPopman=false;
  bool get isloadingpopman=>_isloadingPopman;

  final AnimeService animeService = AnimeService();
  final MangaService mangaService = MangaService();

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
///////////////////////////////////////////////////////////////////
  void getNewReleaseManga(){
    _isloadingManga=true;
    Timer(Duration(seconds: 3), () {
      mangaService.fetchRecentlyUpdatedManga().then((manga) {
        _newlyReleasedMangaList = manga ?? []; // Update with fetched data

        _isloadingManga = false;
        notifyListeners();
      });
    });
  }
  void getUpcomingManga(){
    //_isloadingAnime=true;
    //  Timer(Duration(seconds: 3), () {
    mangaService.fetchUpcomingManga().then((manga) {
      _upcomingMangaList = manga ?? []; // Update with fetched data
      print(_upcomingMangaList.length);
      //  _isloadingAnime = false;
      notifyListeners();
    });
    //});
  }


  void getPopularManga(){
    _isloadingPopman=true;
    Timer(Duration(seconds: 3), () {
      mangaService.fetchPopularManga().then((manga) {
        _popularMangaList = manga ?? []; // Update with fetched data

        _isloadingPopman = false;
        notifyListeners();
      });
    });
  }
}