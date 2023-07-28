class AnimeModel {
  final String id;
  final String title;
  final String description;
  final String posterUrl;

  AnimeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.posterUrl,
  });

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    return AnimeModel(
      id: json['id'],
      title: json['attributes']['canonicalTitle'],
      description: json['attributes']['synopsis'],
      posterUrl: json['attributes']['posterImage']['original'],
    );
  }
}
