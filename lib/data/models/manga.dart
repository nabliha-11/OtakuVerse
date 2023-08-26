class Manga {
  final String id;
  final String title;
  final String description;
  final String posterUrl;
  final int chapters;
  final double averageScore;
  final String siteUrl;


  Manga({
    required this.id,
    required this.title,
    required this.description,
    required this.posterUrl,
    required this.chapters,
    required this.averageScore,
    required this.siteUrl,

  });

  factory Manga.fromJson(Map<String, dynamic> json) {
    return Manga(
      id: json['id'].toString(),
      title: json['title']['romaji'] ?? '',
      description: json['description'] ?? '',
      posterUrl: json['coverImage']['large'] ?? '',
      chapters: json['chapters'] ?? 0,
      averageScore: (json['averageScore'] ?? 0).toDouble(),
      siteUrl: json['siteUrl'] ?? '',
    );
  }
}

