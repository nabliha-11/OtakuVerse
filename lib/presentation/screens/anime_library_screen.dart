import 'package:flutter/material.dart';

class AnimeLibraryScreen extends StatefulWidget {
  @override
  _AnimeLibraryScreenState createState() => _AnimeLibraryScreenState();
}

class _AnimeLibraryScreenState extends State<AnimeLibraryScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anime Library'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Watching'),
            Tab(text: 'Favorite'),
            Tab(text: 'All'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          AnimeList(status: 'Watching'),
          AnimeList(status: 'Favorite'),
          AnimeList(status: 'All'),
        ],
      ),
    );
  }
}

class AnimeList extends StatelessWidget {
  final String status;

  AnimeList({required this.status});

  @override
  Widget build(BuildContext context) {
    // Replace this with your actual logic to fetch and display anime list based on status
    List<String> animeList = ['Anime 1', 'Anime 2', 'Anime 3'];

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: animeList.length,
      itemBuilder: (context, index) {
        return AnimeCard(name: animeList[index]);
      },
    );
  }
}

class AnimeCard extends StatelessWidget {
  final String name;

  AnimeCard({required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Text(name),
      ),
    );
  }
}
