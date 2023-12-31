import 'package:flutter/material.dart';
import '../../../data/models/anime.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimeCard extends StatelessWidget {
  final Anime anime;
  final Function()? onPressed;
  final bool isRectangular;
  final double imageHeight; // Add a parameter for specifying image height

  const AnimeCard({
    required this.anime,
    this.onPressed,
    this.isRectangular = false,
    this.imageHeight = 60.0, // Default image height for standard card shape
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        shape: isRectangular ? RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(left: Radius.circular(16), right: Radius.circular(16)),
        ) : null,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Container(
          height: 200.h,
          width: isRectangular ? double.infinity : 100.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Image.network(
                  anime.posterUrl,
                  fit: BoxFit.cover,
                  height: imageHeight, // Use the specified image height
                  width: isRectangular ? double.infinity : 100.w,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                anime.title,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                anime.description,
                maxLines: 2,
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w200),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
