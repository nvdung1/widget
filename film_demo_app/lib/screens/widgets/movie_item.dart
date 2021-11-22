import 'package:film_demo_app/models/movie.dart';
import 'package:film_demo_app/screens/detail_movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MovieItem extends StatelessWidget {
  Movie movie;
  MovieItem({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, DetailScreen.routerName ,arguments: movie);
      },
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 230,
                width: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(movie.urlImage))),
              ),
              Positioned(
                right: 5,
                bottom: 5,
                child: Text(
                  movie.releaseDate,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                )
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
             movie.nameMovie,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          )
        ],
      )
    );
  }
}
