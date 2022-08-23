import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wall_box/constants/Constants.dart';

class systemItemWidget extends StatelessWidget {
  var title;
  var description;
  systemItemWidget({this.title,this.description});
  @override
  Widget build(BuildContext context) {
    return    Container(
      padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 10
          )]
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('$title',style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),maxLines: 3,),
          SizedBox(height: 5,),
          Center(
            child: Text('$description',style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),),
          ),
        ],
      ),
    );
  }
}