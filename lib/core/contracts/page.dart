import 'package:get/get.dart';
import 'package:test_getx/core/contracts/screen.dart';

abstract class Page extends GetPage{
  Page({required String name,required GetView screen,required Bindings binding}) : super(
    name: name,
    page: () => screen,
    binding: binding
  );
}