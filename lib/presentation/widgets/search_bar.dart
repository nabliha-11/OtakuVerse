import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final void Function(String) onChanged;

  SearchBar({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'Search Anime',
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}
