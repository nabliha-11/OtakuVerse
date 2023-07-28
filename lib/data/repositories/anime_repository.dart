// import '../models/anime.dart';
// import '../services/kitsu_api_service.dart';
//
// class AnimeRepository {
//   final KitsuApiService? _apiService;
//
//   AnimeRepository([this._apiService]);
//
//   Future<List<Anime>> fetchAnimeSuggestions() async {
//     try {
//       final animeList = await _apiService!.fetchAnimeSuggestions();
//       print('Anime List: $animeList');
//       return animeList;
//     } catch (e) {
//       print('Error fetching anime suggestions: $e');
//       throw Exception('Failed to fetch anime suggestions: $e');
//     }
//   }
//
// }
