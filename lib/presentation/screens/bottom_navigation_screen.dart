import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:otakuverse/presentation/screens/home_screen.dart';
import 'package:otakuverse/presentation/screens/anime_library_screen.dart';
import 'package:otakuverse/presentation/screens/manga_library_screen.dart';

class BottomNavigationScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _currentIndex = useState(1);

    final List<Widget> _screens = [
      AnimeLibraryScreen(),
      HomeScreen(),
      MangaLibraryScreen(),
    ];

    return Scaffold(

      body: _screens[_currentIndex.value],
      bottomNavigationBar: AnimatedBottomNavigationBar(
        currentIndex: _currentIndex.value,
        onTap: (index) {
          _currentIndex.value = index;
        },
      ),
    );
  }
}

class AnimatedBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  AnimatedBottomNavigationBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(Icons.video_library_outlined, 'Anime List', 0),
            _buildNavItem(Icons.home, 'Home', 1),
            _buildNavItem(Icons.library_books_outlined, 'Manga List', 2),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData iconData, String label, int index) {
    final selected = currentIndex == index;
    final iconColor = selected ? Colors.deepPurple : Colors.grey;
    final textColor = selected ? Colors.deepPurple : Colors.grey;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData, color: iconColor, size: selected ? 30 : 24),
          Text(label, style: TextStyle(color: textColor)),
        ],
      ),
    );
  }
}
