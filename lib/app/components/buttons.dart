import 'package:audioplayers/src/api/player_state.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:test_getx/app/utils/colors.dart';
import 'package:test_getx/base/controllers/base_controller.dart';

class ButtonHome{

  static Widget btn(Rx<AudioState> icon, Stream<PlayerState> state) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: StreamBuilder<PlayerState>(
        stream: state,
        builder: (context,s){
          print("---------------------------------------------------");
          print(s.data);
          print("---------------------------------------------------");
          if(s.hasData){
          return
            s.data == PlayerState.PLAYING ?
            Icon(FontAwesomeIcons.pause, color: GetColors.mainColor) :
            Icon(FontAwesomeIcons.play, color: GetColors.mainColor);
          }else{
            return Icon(FontAwesomeIcons.play, color: GetColors.mainColor);
          }
        },
      )


    );
  }

  static Widget subBtn(Rx<AudioLoopState> icon) {
    return Container(
      width: 30,
      height: 30,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: icon.value == AudioLoopState.NOTLOOP ?
      Icon(Icons.repeat, color: GetColors.mainColor)
          : Icon(Icons.repeat_one, color: GetColors.mainColor),
    );
  }
  static Widget subBtn2(icon) {
    return Container(
      width: 30,
      height: 30,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: GetColors.mainColor , size:18)
    );
  }
}