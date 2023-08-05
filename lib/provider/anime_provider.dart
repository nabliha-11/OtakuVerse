import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otakuverse/data/models/anime.dart';
import 'package:otakuverse/data/models/manga.dart';

class AnimeProvider extends ChangeNotifier{

  List<Manga> _newlyReleasedMangaList = [];
  List<Manga> get newlyReleasedMangaList => _newlyReleasedMangaList;

  List<Anime> _newlyReleasedAnimeList = [];
  List<Anime> get newlyReleasedAnimeList => _newlyReleasedAnimeList;

  List<Anime> _popularAnimeList = [];
  List<Anime> get popularAnimeList => _popularAnimeList;

  bool _isloadingAnime=false;
  bool get isloadingAnime=>_isloadingAnime;
  bool _isloadingManga=false;
  bool get isloadingManga=>_isloadingManga;
  bool _isloadingPop=false;
  bool get isloadingpop=>_isloadingPop;

  void getNewReleaseAnime(){
    _isloadingAnime=true;
    Timer(Duration(seconds: 3), () {
      _newlyReleasedAnimeList=newlyReleasedAnimeListDB;

      _isloadingAnime=false;
      notifyListeners();
    });


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
      _popularAnimeList=popularAnimeListDB;

      _isloadingPop=false;
      notifyListeners();
    });


  }

}