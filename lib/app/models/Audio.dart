import 'package:test_getx/app/utils/assets.dart';

class Audio{
  final String id;
  final String name = Assets.shaykh;
  String tutorialName;
  final String path;
  final String image = Assets.assets1;

  Audio({required this.id,  required this.tutorialName, required this.path}){
   if( tutorialName.length > 50 ) tutorialName = this.tutorialName.substring(0,50);
  }

  toMap() => {
    "id" : id,
    "name" : name,
    "asset" : path,
  };

}