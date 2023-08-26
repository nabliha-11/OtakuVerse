import 'Staff.dart';
import 'characters.dart';

class Anime {
  final String id;
  final String title;
  final String description;
  final String posterUrl;
  final int episodes;
  final double rating;
  final String siteUrl;
  final String trailerId;
  final List<Character> characters;
 // final List<Staff> staffs;

  Anime({
    required this.id,
    required this.title,
    required this.description,
    required this.posterUrl,
    required this.episodes,
    required this.rating,
    required this.siteUrl,
    required this.trailerId,
    required this.characters,
   // required this.staffs,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      id: json['id'].toString(),
      title: json['title']['romaji'] ?? '',
      description: json['description'] ?? '',
      posterUrl: json['coverImage']['large'] ?? '',
      episodes: json['episodes'] ?? 0,
      rating: (json['averageScore'] ?? 0).toDouble(),
      siteUrl: json['siteUrl'] ?? '',
      trailerId: json['trailer'] != null ? json['trailer']['id']?.toString() ?? '' : '',
      characters: _parseCharacters(json['characters']['nodes']),
     // staffs: _parseStaffs(json['staffs']['nodes']),
    );
  }
  static List<Character> _parseCharacters(List<dynamic> json) {
    List<Character> characters = [];

    for (var characterData in json) {
      Character character = Character(
        id: characterData['id'].toString(),
        name: characterData['name']['full'] ?? '',
        image: characterData['image']['large'] ?? '',
      );
      characters.add(character);
    }

    return characters;
  }

  static List<Staff> _parseStaffs(List<dynamic> json) {
    List<Staff> staffs = [];

    if (json != null && json is List<dynamic>) {
      for (var staffData in json) {
        //List<dynamic> rolesData = staffData['primaryOccupations'] ?? [];
        //List<String> roles = List<String>.from(rolesData.map((role) => role.toString())); // Convert rolesData to a list of strings

        Staff staff = Staff(
          id: staffData['id'].toString(),
          name: staffData['name']['full'] ?? '',
          image: staffData['image']['large'] ?? '',
          //roles: roles, // Store the list of roles
        );
        staffs.add(staff);
      }
    }

    return staffs;
  }



}

