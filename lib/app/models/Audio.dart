import 'package:test_getx/generated/assets.dart';

class Audio{
  final String id;
  final String name = Assets.shaykh;
  final String tutorialName;
  final String path;
  final String image = Assets.assets1;

  Audio({required this.id,  required this.tutorialName, required this.path});

  toMap() => {
    "id" : id,
    "name" : name,
    "asset" : path,
  };

}