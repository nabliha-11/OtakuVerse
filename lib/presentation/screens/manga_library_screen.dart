import 'package:flutter/material.dart';

class MangaLibraryScreen extends StatefulWidget {
  @override
  _MangaLibraryScreenState createState() => _MangaLibraryScreenState();
}

class _MangaLibraryScreenState extends State<MangaLibraryScreen> with SingleTickerProviderStateMixin {
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
        title: Text('Manga Library'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Reading'),
            Tab(text: 'Favorite'),
            Tab(text: 'All'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          MangaList(status: 'Reading'),
          MangaList(status: 'Favorite'),
          MangaList(status: 'All'),
        ],
      ),
    );
  }
}

class MangaList extends StatelessWidget {
  final String status;

  MangaList({required this.status});

  @override
  Widget build(BuildContext context) {
    // Replace this with your actual logic to fetch and display anime list based on status
    List<String> mangaList = ['Manga 1', 'Manga 2', 'Manga 3'];

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: mangaList.length,
      itemBuilder: (context, index) {
        return MangaCard(name: mangaList[index]);
      },
    );
  }
}

class MangaCard extends StatelessWidget {
  final String name;

  MangaCard({required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Text(name),
      ),
    );
  }
}
