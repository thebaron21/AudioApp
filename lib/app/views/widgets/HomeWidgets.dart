import 'package:flutter/material.dart';
import 'package:test_getx/app/models/Audio.dart';
import 'package:test_getx/app/views/pages/AudioPage.dart';
import 'package:test_getx/app/views/widgets/AvatarImage.dart';

class HomeWidget {
  static Widget listTile({required Audio audio}) {
    return Builder(
      builder: (BuildContext context) {
        Size size = MediaQuery.of(context).size;
        return InkWell(
            onTap: () {
              // AppRoute.of(context).push(
              //   () => PlayerPage(
              //     file: audio.path,
              //   ),
              // );
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  audio.image,
                ),
              ),
              title: Text(audio.tutorialName),
              subtitle: Text(audio.name),
            ));
      },
    );
  }
}
