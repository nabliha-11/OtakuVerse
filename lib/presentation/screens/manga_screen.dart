import 'package:flutter/material.dart';

class MangaDemo {
  final String name;
  final String imageUrl;

  MangaDemo({required this.name, required this.imageUrl});
}

class MangaScreen extends StatelessWidget {
  final List<MangaDemo> demoMangaList = [
    MangaDemo(
      name: 'Manga 1',
      imageUrl: 'https://via.placeholder.com/600x400/FF0000/FFFFFF',
    ),
    MangaDemo(
      name: 'Manga 2',
      imageUrl: 'https://via.placeholder.com/600x400/00FF00/000000',
    ),
    MangaDemo(
      name: 'Manga 3',
      imageUrl: 'https://via.placeholder.com/600x400/0000FF/FFFFFF',
    ),
    // Add more demo anime data here
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              expandedHeight: 300,
              flexibleSpace: Stack(
                children: [
                  // Blurry Background for Top Section
                  PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: demoMangaList.length,
                    itemBuilder: (context, index) {
                      return Image.network(
                        'https://images.contentstack.io/v3/assets/blt64b2de096a6f4663/blt764d4a0f5e47474c/644053fc793eef21c330beac/popular_manga.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.low,
                        color: Colors.black.withOpacity(0.5),
                        colorBlendMode: BlendMode.darken,
                      );
                    },
                  ),
                  Positioned(
                    top: 40,
                    left: 16,
                    right: 16,
                    child: Container(
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'MANGA...',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 16,
                    right: 16,
                    child: Container(
                      height: 200,
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: demoMangaList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 150,
                            color: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  demoMangaList[index].name,
                                  style: TextStyle(fontSize: 20, color: Colors.white),
                                ),
                                SizedBox(height: 8),
                                Image.network(
                                  demoMangaList[index].imageUrl,
                                  width: 100,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              // pinned: true,
              floating: true,
              snap: true,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'Trending Now',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 150,
                      color: Colors.blueGrey,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Center(
                        child: Text('Trending Manga ${index + 1}'),
                      ),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'Popular Manga',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return Container(
                    height: 200,
                    color: Colors.green,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Center(
                      child: Text('Popular Manga ${index + 1}'),
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
