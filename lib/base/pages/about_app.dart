import 'package:test_getx/app/views/screens/about.dart';
import 'package:test_getx/base/bindings/about.dart';
import 'package:test_getx/core/contracts/page.dart';

class BaseAboutApp extends Page{
  BaseAboutApp() : super(
    name: "/about",
    screen: BaseAboutScreen(),
    binding: BaseAboutBindings()
  );

}