

// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:movie_review/description.dart';
import 'package:movie_review/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  
  const TrendingMovies({ Key? key, required this.trending }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.all(10),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children:  [
            const textWiget(text: "Trending Movies",size: 30,),
          const SizedBox(height: 10,),
          Container(height: 270,
          child: ListView.builder(itemCount :trending.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Description(name: trending[index]['title'],bannerurl:'http://image.tmdb.org/t//p/w500'+trending[index]['backdrop_path'] ,posterurl: 'http://image.tmdb.org/t//p/w500'+trending[index]['poster_path'],description: trending[index]['overview'],vote: trending[index]['vote_average'].toString(),launchon: trending[index]['release_date'],)));

              },
              child: 
              trending[index]['title']!=null ?Container(
                padding: const EdgeInsets.only(left: 10),
                width: 140,
                child: Column(
                  children: [
                    Container(
                      
                      height: 200,
                      decoration: BoxDecoration(
                        
                        image: DecorationImage(image: NetworkImage(
                        'http://image.tmdb.org/t//p/w500'+trending[index]['poster_path']
                      ))),
                    ),
                    const SizedBox(height: 10,),
                    Flexible(child: Container(child: textWiget(text: trending[index]['title'] ?? 'loading'),))

                  ],
                ),
              ):Container(),
            );
          }),)
         ],
       ),
      
    );
  }
}