import 'package:film_demo_app/models/movie.dart';
import 'package:film_demo_app/screens/widgets/movie_item.dart';
import 'package:flutter/material.dart';

class ListMovie extends StatelessWidget {
  const ListMovie({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView(
       padding: const EdgeInsets.all(12),
        children: DATA_MOVIE.map((e) => MovieItem(movie: e)).toList(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 2/3, //width / height
          crossAxisSpacing: 10,
          mainAxisSpacing: 5
      ),
    );
  }
}
