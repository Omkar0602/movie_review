import 'package:flutter/material.dart';
import 'package:movie_review/utils/text.dart';
class Description extends StatelessWidget {
  final String name,description,bannerurl,posterurl,vote,launchon;
  

   const Description({ Key? key,  required this.name,  required this.description,  required this.bannerurl,  required this.posterurl,  required this.vote,  this.launchon='' }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(child: Container(
                    height: 250,
                    
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(bannerurl,fit: BoxFit.cover,),
                  )),
                  Positioned(bottom: 10,left: 10,
                    child: textWiget(text:'⭐ Average Rating - '+ vote))

                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(padding: const EdgeInsets.all(10),
            // ignore: prefer_if_null_operators, unnecessary_null_comparison
            child: textWiget(text: name!=null?name:'Not Loaded',size: 24,),
            ),
            Container(padding: EdgeInsets.all(10),
            child: textWiget(text: 'Releasing On - '+launchon),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                Flexible(
                  child: Container(
                    child: textWiget(text: description,size: 18,),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}