// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../models/anime.dart';
//
// class KitsuApiService {
//   Future<List<Anime>> fetchAnimeSuggestions() async {
//     final url = Uri.parse('https://kitsu.io/api/edge/anime');
//     final response = await http.get(url, headers: {
//       'Accept': 'application/vnd.api+json',
//       'Content-Type': 'application/vnd.api+json',
//     });
//
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> jsonData = json.decode(response.body);
//       final List<dynamic> animeListJson = jsonData['data'];
//       return animeListJson.map((json) => Anime.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
// }
