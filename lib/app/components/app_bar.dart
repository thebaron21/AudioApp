
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_getx/app/utils/colors.dart';
import 'package:test_getx/app/utils/config.dart';

class AppBarC extends StatelessWidget implements PreferredSizeWidget{
  final bool isHome;
  const AppBarC({Key? key, this.isHome = true}) : super(key: key);
  @override
  Widget build(BuildContext context) {
      return AppBar(
        centerTitle: true,
        title: Text(
          isHome == true ?
          AppConfig.appName
          :AppConfig.infoApp,
          style: GoogleFonts.amiri(),
        ),
        backgroundColor: GetColors.mainColor,
        actions: [
         if(isHome==true) IconButton(
             icon: Icon(FontAwesomeIcons.info),
             onPressed:(){
               Get.toNamed("/about");
             }
         )
        ],
      );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}