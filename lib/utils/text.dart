// ignore_for_file: camel_case_types,

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class textWiget extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
 // final TextOverflow overflow;
   const textWiget({ Key? key, required this.text,  this.color ,  this.size=20 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(

      text,
      
      style: GoogleFonts.breeSerif(
        color : color,fontSize: size,
      )
      
    );
  }
}