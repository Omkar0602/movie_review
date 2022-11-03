// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:movie_review/splash.dart';
import 'package:movie_review/utils/text.dart';
import 'package:movie_review/wigets/search_page.dart';
import 'package:movie_review/wigets/toprated.dart';
import 'package:movie_review/wigets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

import 'wigets/trending.dart';

 void main()=>runApp(const MyApp());

 class MyApp extends StatelessWidget {
   const MyApp({ Key? key }) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       home: const Home(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark,
        primaryColor: Colors.red),
     );
   }
 }

 class Home extends StatefulWidget {
   const Home({ Key? key }) : super(key: key);
 
   @override
   State<Home> createState() => _HomeState();
 }
 
 class _HomeState extends State<Home> {
   List trendingMovies =[];
   List topRatedmovies =[];
   List tv=[];
   
   TextEditingController _searchController = TextEditingController();
   String query='';
      final String apikey='0f5f1078c375db30fc14f9353da0df12';
   final readaccesstoken ='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwZjVmMTA3OGMzNzVkYjMwZmMxNGY5MzUzZGEwZGYxMiIsInN1YiI6IjYyNDNlYzczZGZlMzFkMDA1YmNjODYwNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.I8rhy2Fa8OYMqqIxfkv2XElO8K1l84ByS4BwaWSYkjw';
    
    @override
    void initState()
    {
      loadmovies();
      super.initState();
    }
    loadmovies()async{
      TMDB tmdbWithCustomLogs= TMDB(ApiKeys(apikey, readaccesstoken),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ));
      Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
      Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
      Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();
      setState(() {
        trendingMovies=trendingResult['results']; 
        topRatedmovies=topRatedResult['results'];
        tv=tvResult['results'];
        
      });
      print(trendingMovies);
      
    }

      @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.black,
       appBar: AppBar(
        title:   const textWiget( color: Colors.white,
       
        text: 'Movie Review', size: 30,),
        actions: [IconButton(onPressed:() {
          SearchPage();
        },icon: Icon(Icons.search),)]
        ,backgroundColor: Colors.transparent,),
        
       body: ListView(
         children: [
            TV(tv: tv),
           const SizedBox(height: 5,),
           TrendingMovies(trending :trendingMovies),
           const SizedBox(height: 5,),
           TopRated(topRated: topRatedmovies),
         ],
     )
     );
   }
 }