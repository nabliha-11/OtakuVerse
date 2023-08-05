class Manga {
  final String id;
  final String title;
  final String description;
  final String posterUrl;
  //final String episode;

  Manga({
    required this.id,
    required this.title,
    required this.description,
    required this.posterUrl,
    //required this.episode,
  });

// factory Anime.fromJson(Map<String, dynamic> json) {
//   return Anime(
//     id: json['id'],
//     title: json['attributes']['canonicalTitle'],
//     description: json['attributes']['synopsis'],
//     posterUrl: json['attributes']['posterImage']['original'],
//   );
// }
}


List<Manga> newlyReleasedMangaListDB = [
  Manga(
    id: '1',
    title: 'Jujutsu Kaisen',
    description: 'Yuuji Itadori joins the Jujutsu High School.',
    posterUrl: 'https://m.media-amazon.com/images/I/71+HW7-kq2L._AC_UF1000,1000_QL80_.jpg',
  ),
// Add more newly released manga data here
];
