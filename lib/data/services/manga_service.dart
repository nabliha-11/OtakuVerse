import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:otakuverse/data/models/manga.dart';
import 'package:otakuverse/utils/network_utils.dart';

class MangaService {
  Future<List<Manga>?> fetchPopularManga() async {
    final apiUrl = 'https://graphql.anilist.co';

    final query = '''
      query {
        Page(page: 1, perPage: 10) {
          media(sort: TRENDING, type: MANGA) {
            id
            title {
              romaji
              english
              native
            }
            description
            coverImage {
              large
            }
            chapters
            averageScore
            siteUrl
          }
        }
      }
    ''';

    final response = await http.post(Uri.parse(apiUrl), body: {'query': query});

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data']['Page']['media'];
      return List<Manga>.from(
          data.map((mangaData) => Manga.fromJson(mangaData)));
    } else {
      throw Exception('Failed to load popular animes');
    }
  }

  Future<List<Manga>?> fetchRecentlyUpdatedManga() async {
    final apiUrl = 'https://graphql.anilist.co';

    final query = '''
      query {
        Page(page: 1, perPage: 10) {
          media(sort: UPDATED_AT_DESC, type: MANGA) {
            id
            title {
              romaji
              english
              native
            }
            description
            coverImage {
              large
            }
            chapters
            averageScore
            siteUrl
          
          }
        }
      }
    ''';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'query': query}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data']['Page']['media'];
      return List<Manga>.from(
          data.map((mangaData) => Manga.fromJson(mangaData)));
    } else {
      throw Exception('Failed to load recently updated animes');
    }
  }

  Future<List<Manga>?> fetchUpcomingManga() async {
    final apiUrl = 'https://graphql.anilist.co';

    final query = '''
      query {
              Page(page: 1, perPage: 10) {
                media(sort: START_DATE, type: MANGA, isAdult: false,startDate_greater:20230811)
             {
                  id
                  title {
                    romaji
                    english
                    native
                  }
                  description
                  coverImage {
                    large
                  }
                  
                  chapters
                  averageScore
                  siteUrl
                  trailer {
                    id
                  }
                }
              }
            }
    ''';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'query': query}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data']['Page']['media'];
      return List<Manga>.from(
          data.map((mangaData) => Manga.fromJson(mangaData)));
    } else {
      throw Exception('Failed to load recently updated animes');
    }
  }
}

