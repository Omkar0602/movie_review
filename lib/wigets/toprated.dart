// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movie_review/description.dart';
import 'package:movie_review/utils/text.dart';

class TopRated extends StatelessWidget {
  final List topRated;
  const TopRated({ Key? key, required this.topRated }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
           const textWiget(text: "Top Rated Movies", size: 30,),
           const SizedBox(height: 20,),
          Container(
            height: 270,
            child: ListView.builder(itemCount: topRated.length,
            scrollDirection: Axis.horizontal
            , itemBuilder: ((context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Description(name: topRated[index]['title'],bannerurl:'http://image.tmdb.org/t//p/w500'+topRated[index]['backdrop_path'] ,posterurl: 'http://image.tmdb.org/t//p/w500'+topRated[index]['poster_path'],description: topRated[index]['overview'],vote: topRated[index]['vote_average'].toString(),launchon: topRated[index]['release_date'],)));

                  
                },

                child: Container(
                  width: 140,
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(
                          'http://image.tmdb.org/t//p/w500'+topRated[index]['poster_path']
                        ))),
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        child: textWiget(text: topRated[index]['title'] ?? 'loading')
                      )
                    ],
                  ),


                ),
              );
            }))
            
          )
        ],
      ),
      
    );
  }
}