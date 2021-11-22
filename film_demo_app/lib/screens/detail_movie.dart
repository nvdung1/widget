
import 'package:film_demo_app/models/actor.dart';
import 'package:film_demo_app/models/movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);
  static const routerName ='/DetailMovie';

  @override
  Widget build(BuildContext context) {
    final movie= ModalRoute.of(context)!.settings.arguments as Movie;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 15.0),
            child: Icon(Icons.favorite_border),
          )
        ],
      ),
      body: Stack(
        children: [
          Image.asset(movie.urlImage,
          fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white.withOpacity(0.8),
          ),
          _body(context, movie)
        ],
      ),
    );
  }
  Widget _body(BuildContext context, Movie movie){
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children:  [
        const SizedBox(
          height: 20,
        ),
        _header(movie),
        const SizedBox(
          height: 20,
        ),
        _cast(),
        const SizedBox(
          height: 20,
        ),
        _overview(movie)
      ],
    );
  }
  Widget _header(Movie movie){
    return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Container(
                width: 100,
                height: 150,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image:  DecorationImage(
                    image: AssetImage(movie.urlImage),fit: BoxFit.cover
                  )
                ),
              ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                        movie.nameMovie,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          const Text("Xuất bản: "),
                          Expanded(
                              child: Text(movie.releaseDate))
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Thể loại: "),
                          Expanded(
                              child: Text(
                                  "Phim hoạt hình, Phim phiêu lưu, Phim giả tưởng, Phim gia đình"))
                        ],
                      )
                    ],
                  ),
                )
            )
          ],
        ),
    );
  }
  Widget _cast(){
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:   [
              const Text(
                "Cast",
                style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
               height: 10,
              ),
              Container(
                  height: 180,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: listItemActor.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                          return _iteamCast(listItemActor[index]);
                }),
          )
        ],
      ),
    );
  }
  Widget _iteamCast( Actor actor){
    return Container(
      margin: const EdgeInsets.only( right:  12),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: 100,
              height: 160,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                      image: AssetImage(actor.urlPhoto!), fit: BoxFit.cover)),
            ),
          ),
          Text(
            actor.name!,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(
            actor.character!,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
  Widget _overview(Movie movie){
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
            children:  [
              const Text(
                "Overview",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(movie.description, style: const TextStyle(fontSize: 16),)
      ],
    ),
    );
  }
}
