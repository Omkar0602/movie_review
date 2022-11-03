// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movie_review/description.dart';
import 'package:movie_review/utils/text.dart';

class TV extends StatelessWidget {
  final List tv;
  const TV({ Key? key, required this.tv }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
           const textWiget(text: "Popular TV shows", size: 30,),
           const SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.only(left: 30),
            height: 250,
            child: ListView.builder(itemCount: tv.length,
            scrollDirection: Axis.horizontal
            , itemBuilder: ((context, index) {
              return InkWell(
                onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> Description(name: tv[index]['original_name'],bannerurl:'http://image.tmdb.org/t//p/w500'+tv[index]['backdrop_path'] ,posterurl: 'http://image.tmdb.org/t//p/w500'+tv[index]['poster_path'],description: tv[index]['overview'],vote: tv[index]['vote_average'].toString(),)));

                },

                child: Container(
                  padding: EdgeInsets.only(left: 10),
                 
                  width: 250,
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                         
                        width: 250,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(image: NetworkImage(
                          'http://image.tmdb.org/t//p/w500'+tv[index]['backdrop_path']
                        )
                        )
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        child: textWiget(text: tv[index]['original_name'] ?? 'loading')
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