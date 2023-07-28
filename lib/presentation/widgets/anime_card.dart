import 'package:flutter/material.dart';
import '../../../data/models/anime.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimeCard extends StatelessWidget {
  final Anime anime;
  final Function()? onPressed;

  const AnimeCard({required this.anime,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Container(
          height: 200.h,
          width: 100.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Image.network(
                  anime.posterUrl,
                  fit: BoxFit.cover,
                  height: 60,
                  width: 100,

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
