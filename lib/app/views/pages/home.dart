// import 'package:flutter/material.dart';
// import 'package:test_getx/app/models/Audio.dart';
// import 'package:test_getx/app/utills/list_auios.dart';
// import 'package:test_getx/app/views/widgets/HomeWidgets.dart';
// import 'package:test_getx/generated/assets.dart';
//
// class HomePageView extends StatefulWidget {
//   const HomePageView({Key? key}) : super(key: key);
//
//   @override
//   _HomePageViewState createState() => _HomePageViewState();
// }
//
// class _HomePageViewState extends State<HomePageView> {
//   @override
//   void initState() {
//     super.initState();
// //
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//       ),
//       body: ListView.builder(
//         itemCount: AudioServiceList.listPath2().length,
//         itemBuilder: (BuildContext context, int index) {
//           return HomeWidget.listTile(
//             audio: Audio(
//               image: AudioServiceList.listPath2()[index].image,
//               name: AudioServiceList.listPath2()[index].name,
//               tutorialName: AudioServiceList.listPath2()[index].tutorialName,
//               path: AudioServiceList.listPath2()[index].path,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
