import 'package:test_getx/app/models/Audio.dart';
import 'package:test_getx/generated/assets.dart';

class AudioServiceList{
  static final int _max =  14;
  static String _path = "assets";
  List<Audio> audios = [];
  static List<Audio> audios2 = [];

  listPath(){
    for( int i = 1 ; i <= _max ; i++ ){
      audios.add(
          Audio(tutorialName: "1", path: "$_path/audios/$i.mp3")
      );
    }
  }

  static listPath2(){
    for( int i = 1 ; i <= _max ; i++ ){
      audios2.add(
          Audio( tutorialName: "1", path: "$_path/audios/$i.mp3")
      );
    }
    return audios2;
  }
}