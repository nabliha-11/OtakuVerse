import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:otakuverse/data/models/anime.dart';
import 'package:otakuverse/utils/network_utils.dart';

class AnimeService {
  Future<List<Anime>?> fetchPopularAnimes() async {
    final apiUrl = 'https://graphql.anilist.co';

    final query = '''
      query {
        Page(page: 1, perPage: 10) {
          media(sort: POPULARITY_DESC, type: ANIME) {
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
            episodes
            averageScore
            siteUrl
            trailer {
              id
            }
             characters {
          nodes {
            id
            name {
              full
            }
            image {
              large
            }
          }
        }
        staff {
          nodes {
            id
            name {
              full
            }
            image {
              large
            }
            primaryOccupations
          }
        }
          }
        }
      }
    ''';

    final response = await http.post(Uri.parse(apiUrl), body: {'query': query});

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data']['Page']['media'];
      return List<Anime>.from(
          data.map((animeData) => Anime.fromJson(animeData)));
    } else {
      throw Exception('Failed to load popular animes');
    }
  }

  Future<List<Anime>?> fetchRecentlyUpdatedAnimes() async {
    final apiUrl = 'https://graphql.anilist.co';

    final query = '''
      query {
        Page(page: 1, perPage: 10) {
          media(sort: UPDATED_AT_DESC, type: ANIME) {
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
            episodes
            averageScore
            siteUrl
            trailer {
              id
            }
             staff {
          nodes {
            id
            primaryOccupations
            name {
              full
            }
            image {
              large
            }
          }
        }
            characters {
          nodes {
            id
            name {
              full
            }
            image {
              large
            }
          }
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
    print(response.body);

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data']['Page']['media'];
      return List<Anime>.from(
          data.map((animeData) => Anime.fromJson(animeData)));
    } else {
      throw Exception('Failed to load recently updated animes');
    }
  }

  Future<List<Anime>?> fetchUpcomingAnimes() async {
    final apiUrl = 'https://graphql.anilist.co';

    final query = '''
      query {
        Page(page: 1, perPage: 10) {
          media(sort: START_DATE, type: ANIME, isAdult: false,startDate_greater:20230811) {
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
            episodes
            averageScore
            siteUrl
            trailer {
              id
            }
           characters {
          nodes {
            id
            name {
              full
            }
            image {
              large
            }
          }
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
      return List<Anime>.from(
          data.map((animeData) => Anime.fromJson(animeData)));
    } else {
      throw Exception('Failed to load recently updated animes');
    }
  }
}

