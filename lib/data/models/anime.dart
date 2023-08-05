class Anime {
  final String id;
  final String title;
  final String description;
  final String posterUrl;
  //final String episode;

  Anime({
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

List<Anime> newlyReleasedAnimeListDB = [
  Anime(
    id: '1',
    title: 'Demon Slayer: Mugen Train',
    description: 'Tanjiro and his friends join the Mugen Train arc.',
    posterUrl: 'https://m.media-amazon.com/images/M/MV5BODI2NjdlYWItMTE1ZC00YzI2LTlhZGQtNzE3NzA4MWM0ODYzXkEyXkFqcGdeQXVyNjU1OTg4OTM@._V1_.jpg',
  ),
  Anime(
    id: '2',
    title: 'Cowboy Bebop',
    description: 'Aboard the spaceship Bebop, a bounty hunter and his group of skilled comrades embark on adventures across the Solar System to capture criminals.',
    posterUrl: 'https://static.wikia.nocookie.net/doblaje/images/3/34/Cowboy_Bebop_Poster_Original.png/revision/latest?cb=20220315022317&path-prefix=es',
  ),
  Anime(
    id: '3',
    title: 'One Piece',
    description: 'Follows the adventures of Monkey D. Luffy and his pirate crew in order to find the greatest treasure ever left by the legendary Pirate, Gold Roger',
    posterUrl: 'https://static.wikia.nocookie.net/dubbing9585/images/9/9a/One_Piece.jpg/revision/latest?cb=20210111051837',
  ),
// Add more newly released anime data here
  Anime(
    id: '4',
    title: 'Naruto',
    description: 'Dattebayo',
    posterUrl: 'https://upload.wikimedia.org/wikipedia/en/9/94/NarutoCoverTankobon1.jpg',
  ),
];
// List<Anime> newlyReleasedMangaListDB = [
//   Anime(
//     id: '1',
//     title: 'Jujutsu Kaisen',
//     description: 'Yuuji Itadori joins the Jujutsu High School.',
//     posterUrl: 'https://m.media-amazon.com/images/I/71+HW7-kq2L._AC_UF1000,1000_QL80_.jpg',
//   ),
// // Add more newly released manga data here
// ];
List<Anime> popularAnimeListDB = [
  Anime(
    id: '1',
    title: 'Dragon Ball Super',
    description: 'Goku\'s adventures after defeating Majin Buu.',
    posterUrl: 'https://wallpapercave.com/wp/wp6778321.jpg',
  ),
//Add more popular anime data here
  Anime(
    id: '2',
    title: 'HunterXHunter',
    description: 'Hunter × Hunter is an anime television series that aired from 2011 to 2014 based on Yoshihiro Togashi\'s manga series Hunter × Hunter.',
    posterUrl: 'https://www.comingsoon.net/wp-content/uploads/sites/3/2023/07/Hunter-X-Hunter.jpe',
  ),
];
