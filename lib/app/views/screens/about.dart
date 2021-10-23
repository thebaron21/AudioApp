import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_getx/app/components/app_bar.dart';
import 'package:test_getx/app/utils/assets.dart';
import 'package:test_getx/app/utils/colors.dart';
import 'package:test_getx/app/utils/config.dart';
import 'package:test_getx/core/contracts/screen.dart';

class BaseAboutScreen extends Screen {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarC(isHome: false),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.2,
            ),
            _logoApp(),
            _contentApp(),
            _shareApp()
          ],
        ),
      ),
    );
  }

  _logoApp(){
    return Image.asset(
      Assets.assets1,
      width: 150,
      fit: BoxFit.cover,
    );
  }

  _contentApp(){
    return    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 30),
      child: Text(
        AppConfig.contentShare,
        textAlign: TextAlign.center,
        style: GoogleFonts.amiri(
          fontSize: 19,
          fontWeight: FontWeight.w600,
          color: GetColors.mainColor,
        ),
      ),
    );
  }

  _shareApp() {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 130,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(3),
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                  color: GetColors.mainColor, shape: BoxShape.circle),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.share,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              AppConfig.shareApp,
              style: GoogleFonts.amiri(
                fontSize: 20,
                color: GetColors.mainColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
