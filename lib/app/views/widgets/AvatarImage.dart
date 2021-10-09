import 'dart:math';

import 'package:flutter/material.dart';

class AvatarImage extends StatelessWidget{
  final String path;

  const AvatarImage({Key? key, required this.path}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: MediaQuery.of(context).size.height / 3,
        margin: EdgeInsets.only( top: MediaQuery.of(context).size.height / 10 ),
        padding: EdgeInsets.all( MediaQuery.of(context).size.width / 30 ),
        decoration: BoxDecoration(
            color: Colors.teal.withOpacity( 0.4 ),
            shape: BoxShape.circle
        ),
        child: ClipOval(
            clipper: Clipper(),
            child: Image.asset( path ,
              fit: BoxFit.cover,
            )
        ),
      ),
    );
  }
}

class Clipper extends CustomClipper<Rect>{
  @override
  Rect getClip(Size size) {

    return Rect.fromCircle(
        center: Offset( size.width /2 , size.height / 2 ),
        radius: min( size.width , size.height) / 2
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}