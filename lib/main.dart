import 'package:flutter/material.dart';

import 'app/views/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePageView(),
    );
  }
}
abstract class Model {
  Map<String,dynamic> toMap();
}
abstract class BaseModel<Model>{
  BaseModel.fromJson();
  BaseModel.withError();
}
class NewModel extends Model{
  final String name;


  NewModel(this.name);

  @override
  Map<String, dynamic> toMap() =>  {
    "name" : name
  };
}
class News extends BaseModel<NewModel>{
  News.withError() : super.withError(){
    print("error");
  }
  News.fromJson()  : super.fromJson(){
    print("From json");
  }


}
