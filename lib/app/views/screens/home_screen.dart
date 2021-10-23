import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_getx/app/components/app_bar.dart';
import 'package:test_getx/app/components/buttons.dart';
import 'package:test_getx/app/components/slider_timer.dart';
import 'package:test_getx/app/components/timer.dart';
import 'package:test_getx/app/models/Audio.dart';
import 'package:test_getx/base/controllers/base_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends GetView<BaseController> {
  @override
  Widget build(BuildContext context) {
    return GetX<BaseController>(
      builder: (controller) => Scaffold(
        appBar: AppBarC(),
        body: ListView.builder(
          itemCount: controller.audios.length,
          itemBuilder: (context, i) {
            Audio audio = controller.audios[i];
            return GestureDetector(
              onTap: () {
                controller.current(i);
                controller.play(i);
              },
              child: ListTile(
                trailing:
                controller.realAudio.value == i
                    ? Icon( FontAwesomeIcons.waveSquare , size: 15, )
                    : Icon( FontAwesomeIcons.waveSquare , color: Colors.white, size: 15, )
                ,
                leading: CircleAvatar(
                  backgroundImage: AssetImage(audio.image),
                ),
                selectedTileColor: Colors.red,
                title: Text(audio.tutorialName, style: GoogleFonts.amiri()),
                subtitle: Text(audio.name, style: GoogleFonts.amiri()),
              ),
            );
          },
        ),
        bottomNavigationBar: Container(
          width: Get.width,
          color: Colors.teal.withOpacity(0.3),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          height: Get.height * 0.2,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Time(controller.positionStream),
                  Text(
                      controller.audios[controller.current.value].tutorialName),
                  Time(controller.durationStream),
                ],
              ),
              SliderTime(controller.positionStream, controller.durationStream,
                  controller),
              SizedBox(
                width: Get.width * 0.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () async {
                        controller.stop();
                      },
                      child: ButtonHome.subBtn2(FontAwesomeIcons.stop),
                    ),
                    // TODO: Add Button Next Audio
                    InkWell(
                      onTap: () async {
                        controller.play(controller.current.value);
                      },
                      child: ButtonHome.btn(controller.audioState,controller.state),
                    ),
                    // TODO: Add Button Back Audio
                    InkWell(
                      onTap: () {
                        controller.loop();
                      },
                      child: ButtonHome.subBtn(controller.audioLoopState),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
